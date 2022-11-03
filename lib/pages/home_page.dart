import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:syncfusion_flutter_calendar/calendar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfCalendar(
        view: CalendarView.week,
        dataSource: MeetingDataSource(getAppointments())
      ),
    );
  }
}

List<Appointment> getAppointments() {
  List<Appointment> meetings = <Appointment>[];
  final DateTime today = DateTime.now();
  final DateTime startTime =
      DateTime(today.year, today.month, today.day, 9, 0, 0);
  final DateTime endTime = startTime.add(const Duration(hours: 2));

  meetings.add(Appointment(
      startTime: startTime,
      endTime: endTime,
      subject: "Shower Installation",
      color: Colors.blue, 
      recurrenceRule: 'FREQ=DAILY;COUNT=10',
      isAllDay: true));

  return meetings;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}
