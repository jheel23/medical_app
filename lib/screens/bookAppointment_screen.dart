import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medical_app/providers/custom_functions.dart';
import 'package:table_calendar/table_calendar.dart';

import '../providers/myAppointment_provider.dart';

class BookAppointmentScreen extends ConsumerStatefulWidget {
  const BookAppointmentScreen({super.key});

  @override
  ConsumerState<BookAppointmentScreen> createState() =>
      _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends ConsumerState<BookAppointmentScreen> {
  DateTime selectedDate = DateTime.now();
  String selectedTime = '';
  bool isAllSelected = false;
  Map<String, dynamic> appointment = {};
  void _daySelected(DateTime day, DateTime focusedDay) {
    if (day.isBefore(DateTime.now())) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        content: Align(
          alignment: Alignment.center,
          child: Text('Please select a valid date',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: Colors.white)),
        ),
      ));
    } else {
      setState(() {
        selectedDate = day;
      });
    }
  }

  OutlinedButton selectTimeButton(ThemeData theme, String time) {
    return OutlinedButton(
      onPressed: () {
        _appointmentSelected(time);
      },
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: theme.colorScheme.primary, width: 2),
        backgroundColor:
            time == selectedTime ? theme.colorScheme.primary : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(time,
          style: theme.textTheme.headlineSmall!.copyWith(
              color: time == selectedTime
                  ? Colors.white
                  : theme.colorScheme.primary,
              fontSize: 12)),
    );
  }

  void _appointmentSelected(String time) {
    setState(() {
      selectedTime = time;
      appointment = {
        'date': selectedDate.toIso8601String(),
        'time': selectedTime,
      };
      isAllSelected = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        actions: const [
          IconButton(
              onPressed: showToast,
              icon: Icon(
                Icons.more_vert,
                color: Color(0xff16C2D5),
              ))
        ],
        title: Text(
          'Book Appointment',
          style: theme.textTheme.displayMedium,
        ),
      ),
      body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Select Date',
              style: theme.textTheme.headlineMedium,
            ),
            TableCalendar(
              rowHeight: 40,
              selectedDayPredicate: (day) => isSameDay(day, selectedDate),
              onDaySelected: _daySelected,
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                titleTextStyle: theme.textTheme.headlineMedium!,
                leftChevronIcon: Icon(
                  Icons.chevron_left,
                  color: theme.colorScheme.primary,
                ),
                rightChevronIcon: Icon(
                  Icons.chevron_right,
                  color: theme.colorScheme.primary,
                ),
              ),
              focusedDay: selectedDate,
              firstDay: DateTime(2020),
              lastDay: DateTime(2030),
            ),
            const SizedBox(height: 20),
            Text(
              'Select Time',
              style: theme.textTheme.headlineMedium,
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 15,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                selectTimeButton(theme, '08:00 AM'),
                selectTimeButton(theme, '09:00 AM'),
                selectTimeButton(theme, '10:00 AM'),
                selectTimeButton(theme, '11:00 AM'),
                selectTimeButton(theme, '12:00 AM'),
                selectTimeButton(theme, '01:00 PM'),
                selectTimeButton(theme, '02:00 PM'),
                selectTimeButton(theme, '03:00 PM'),
                selectTimeButton(theme, '04:00 PM'),
                selectTimeButton(theme, '05:00 PM'),
                selectTimeButton(theme, '06:00 PM'),
              ],
            ),
          ])),
      bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          elevation: 0,
          surfaceTintColor: Colors.transparent,
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                  if (!isAllSelected) {
                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      content: Align(
                        alignment: Alignment.center,
                        child: Text('Please select an appointment.',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(color: Colors.white)),
                      ),
                    ));
                  } else {
                    ref.read(myAppointmentProvider.notifier).addAppointment(
                        {'date': selectedDate, 'time': selectedTime});
                    Navigator.of(context).pop();
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                child: Text('Schedule',
                    style: theme.textTheme.displayMedium!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold))),
          )),
    );
  }
}
