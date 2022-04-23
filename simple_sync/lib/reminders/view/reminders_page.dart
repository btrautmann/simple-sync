import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:simple_sync/reminders/cubit/reminders_cubit.dart';
import 'package:simple_sync/reminders/models/reminder.dart';

class RemindersPage extends StatelessWidget {
  const RemindersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reminders'),
      ),
      body: const Center(child: RemindersList()),
    );
  }
}

class RemindersList extends StatelessWidget {
  const RemindersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RemindersCubit(),
      child: BlocBuilder<RemindersCubit, RemindersState>(
        builder: (_, state) {
          if (state.user == null) {
            return const CircularProgressIndicator();
          }
          if (state.reminders.isEmpty) {
            return MaterialButton(
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
          return ListView.builder(
            itemCount: state.reminders.length,
            itemBuilder: (_, index) {
              return ListTile(
                title: Text(state.reminders[index].title),
              );
            },
          );
        },
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
                        widget.onReminderValid(
                          Reminder(
                            title: controller.text,
                            time: dateTime.microsecondsSinceEpoch,
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
