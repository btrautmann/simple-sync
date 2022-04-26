import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:simple_sync/reminders/cubit/reminders_cubit.dart';
import 'package:simple_sync/reminders/models/reminder.dart';
import 'package:simple_sync/reminders/models/sync_group.dart';
import 'package:uuid/uuid.dart';

class RemindersPage extends StatelessWidget {
  const RemindersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RemindersCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Reminders'),
        ),
        body: const Center(child: RemindersList()),
        floatingActionButton: const AddReminderFloatingActionButton(),
      ),
    );
  }
}

class AddReminderFloatingActionButton extends StatelessWidget {
  const AddReminderFloatingActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RemindersCubit, RemindersState>(
      builder: (_, state) {
        if (state.user != null && state.reminders.isNotEmpty) {
          return FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () async {
              await showDialog<void>(
                context: _,
                builder: (_) {
                  return CreateReminderDialog(
                    onReminderValid: (reminder) {
                      context.read<RemindersCubit>().createReminder(reminder);
                    },
                  );
                },
              );
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class RemindersList extends StatelessWidget {
  const RemindersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RemindersCubit, RemindersState>(
      builder: (_, state) {
        final user = state.user;
        if (user == null) {
          return const CircularProgressIndicator();
        }
        if (state.reminders.isEmpty) {
          if (user.selectedSyncGroupId == null) {
            return ElevatedButton(
              onPressed: () async {
                await showDialog<Reminder>(
                  context: _,
                  builder: (context) => CreateSyncGroupDialog(
                    onGroupValid: (value) {
                      _.read<RemindersCubit>().createSyncGroup(value);
                    },
                  ),
                );
              },
              child: const Text('New Group'),
            );
          } else {
            return ElevatedButton(
              onPressed: () async {
                await showDialog<Reminder>(
                  context: _,
                  builder: (context) => CreateReminderDialog(
                    onReminderValid: (value) {
                      _.read<RemindersCubit>().createReminder(value);
                    },
                  ),
                );
              },
              child: const Text('New Reminder'),
            );
          }
        }
        return ListView.builder(
          itemCount: state.reminders.length,
          itemBuilder: (_, index) {
            return ListTile(
              leading: Checkbox(
                checkColor: Colors.white,
                value: false,
                shape: const CircleBorder(),
                onChanged: (bool? value) {
                  print('${state.reminders[index].title} clicked');
                },
              ),
              title: Text(state.reminders[index].title),
              subtitle: Text(
                state.reminders[index].time.format(
                  context,
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class CreateReminderDialog extends StatefulWidget {
  const CreateReminderDialog({
    Key? key,
    required this.onReminderValid,
  }) : super(key: key);

  final ValueSetter<Reminder> onReminderValid;

  @override
  State<CreateReminderDialog> createState() => _CreateReminderDialogState();
}

class _CreateReminderDialogState extends State<CreateReminderDialog> {
  final _formKey = GlobalKey<FormState>();
  DateTime dateTime = DateTime.now();
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Material(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: TextFormField(
                      controller: controller,
                      decoration: const InputDecoration(
                        hintText: 'Reminder name',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: DateTimeField(
                      decoration: const InputDecoration(
                        hintText: 'Reminder time',
                      ),
                      format: DateFormat('hh:mm a'),
                      onShowPicker: (context, currentValue) async {
                        final time = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.fromDateTime(
                            currentValue ?? DateTime.now(),
                          ),
                        );
                        return time == null
                            ? null
                            : DateTimeField.convert(
                                time,
                              );
                      },
                      validator: (value) {
                        if (value != null) {
                          dateTime = value;
                          return null;
                        }
                        return 'Please choose a time';
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final timeOfDay = TimeOfDay.fromDateTime(dateTime);
                        widget.onReminderValid(
                          Reminder(
                            title: controller.text,
                            time: timeOfDay,
                          ),
                        );
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CreateSyncGroupDialog extends StatefulWidget {
  const CreateSyncGroupDialog({
    Key? key,
    required this.onGroupValid,
  }) : super(key: key);

  final ValueSetter<SyncGroup> onGroupValid;

  @override
  State<CreateSyncGroupDialog> createState() => _CreateSyncGroupState();
}

class _CreateSyncGroupState extends State<CreateSyncGroupDialog> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController passphraseController;

  @override
  void initState() {
    nameController = TextEditingController();
    passphraseController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Material(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        hintText: 'Group name',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: TextFormField(
                      controller: passphraseController,
                      decoration: const InputDecoration(
                        hintText: 'Group passphrase',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        widget.onGroupValid(
                          SyncGroup(
                            name: nameController.text,
                            passphrase: passphraseController.text,
                            id: const Uuid().v4(),
                          ),
                        );
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
