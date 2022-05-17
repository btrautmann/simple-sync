import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:simple_sync/reminders/cubit/reminders_cubit.dart';
import 'package:simple_sync/reminders/models/reminder.dart';
import 'package:simple_sync/reminders/models/sync_group.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:uuid/uuid.dart';

class RemindersPage extends StatelessWidget {
  const RemindersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RemindersCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: BlocBuilder<RemindersCubit, RemindersState>(
            builder: (context, state) {
              final selectedGroup = state.syncGroup;
              return selectedGroup == null ? const Text('Simple Sync') : Text(selectedGroup.name);
            },
          ),
          actions: const [
            _JoinGroupButton(),
          ],
        ),
        body: const Center(child: RemindersList()),
        floatingActionButton: const AddReminderFloatingActionButton(),
      ),
    );
  }
}

class _JoinGroupButton extends StatefulWidget {
  const _JoinGroupButton({
    Key? key,
  }) : super(key: key);

  @override
  State<_JoinGroupButton> createState() => _JoinGroupButtonState();
}

class _JoinGroupButtonState extends State<_JoinGroupButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        await showDialog<Reminder>(
          context: context,
          builder: (dialog) => JoinSyncGroupDialog(
            onJoinSubmit: (name, passphrase) async {
              final success = await context.read<RemindersCubit>().joinSyncGroup(name, passphrase);
              final message = success ? 'Success!' : 'Incorrect group name or passphrase.';
              if (success && mounted) {
                ScaffoldMessenger.of(dialog)
                  ..clearSnackBars()
                  ..showSnackBar(SnackBar(content: Text(message)));
              }
            },
          ),
        );
      },
      icon: const Icon(Icons.people),
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
        // Rebuild the list every minute for now, because this will cause items to turn
        // red when they are due if the screen is currently shown
        return TimerBuilder.periodic(
          const Duration(minutes: 1),
          builder: (_) {
            return ListView.builder(
              itemCount: state.reminders.length,
              itemBuilder: (_, index) {
                return ReminderListTile(
                  state.reminders[index],
                  key: ValueKey<String>(state.reminders[index].id),
                );
              },
            );
          },
        );
      },
    );
  }
}

class ReminderListTile extends StatelessWidget {
  const ReminderListTile(
    this.reminder, {
    Key? key,
  }) : super(key: key);

  final Reminder reminder;

  @override
  Widget build(BuildContext context) {
    // If completed, hide
    // - completed early if last complete is after midnight but before reminder time
    // - completed normally if last complete is after reminder time but before next midnight
    // If overdue, show red
    // - overdue if NOT completed early and time is after reminder time
    // If not overdue, show normal
    // - not overdue if NOT completed early and time is before reminder time
    final currentTime = TimeOfDay.now();
    final currentDay = DateTime.now();
    final tomorrow = currentDay.add(const Duration(days: 1));
    final midnightBefore = DateTime(currentDay.year, currentDay.month, currentDay.day);
    final midnightAfter = DateTime(tomorrow.year, tomorrow.month, tomorrow.day);
    final reminderTime =
        DateTime(currentDay.year, currentDay.month, currentDay.day, reminder.time.hour, reminder.time.minute);
    final lastComplete = DateTime.fromMillisecondsSinceEpoch(reminder.lastCompleteMsSinceEpoch);
    final isCompletedEarly = lastComplete.isAfter(midnightBefore) && lastComplete.isBefore(reminderTime);
    final isCompletedNormally = lastComplete.isBefore(midnightAfter) && lastComplete.isAfter(reminderTime);
    final isOverdue = currentTime.toDouble() > reminder.time.toDouble() && !isCompletedEarly && !isCompletedNormally;

    if (isCompletedEarly || isCompletedNormally) {
      return const SizedBox.shrink();
    }

    return ListTile(
      leading: Checkbox(
        checkColor: Colors.white,
        value: false,
        shape: const CircleBorder(),
        onChanged: (bool? value) {
          context.read<RemindersCubit>().completeReminder(reminder);
        },
      ),
      title: Text(
        reminder.title,
        style: isOverdue ? Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.red) : null,
      ),
      subtitle: Text(
        reminder.time.format(
          context,
        ),
        style: isOverdue ? Theme.of(context).textTheme.subtitle2?.copyWith(color: Colors.red) : null,
      ),
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
                            id: const Uuid().v4(),
                            lastCompleteMsSinceEpoch: 0,
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

class JoinSyncGroupDialog extends StatefulWidget {
  const JoinSyncGroupDialog({
    Key? key,
    required this.onJoinSubmit,
  }) : super(key: key);

  final void Function(String groupName, String passphrase) onJoinSubmit;

  @override
  State<JoinSyncGroupDialog> createState() => _JoinSyncGroupState();
}

class _JoinSyncGroupState extends State<JoinSyncGroupDialog> {
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
                        widget.onJoinSubmit(
                          nameController.text,
                          passphraseController.text,
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
