library new_attempt.globals;
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../home_page.dart';

// List appoint = ['DateTime(2022, 11, 16, 9, 0, 0)', 'DateTime(2022, 11, 16, 11, 0, 0)', 'Shower Install', 'lightBlue'];

String userEmail = '';

MeetingDataSource getAppointments() {
  List<Appointment> appointments = <Appointment>[];

  appointments.add(Appointment(
    startTime: DateTime(2022, 11, 16, 9, 0, 0),
    endTime: DateTime(2022, 11, 16, 11, 0, 0),
    subject: "Shower Install",
    color: Colors.lightBlue,
  ));

  appointments.add(Appointment(
    startTime: DateTime(2022, 11, 18, 14, 0, 0),
    endTime: DateTime(2022, 11, 18, 17, 0, 0),
    subject: "Shower Install: The Sequal",
    color: Colors.green,
  ));

  return MeetingDataSource(appointments);
}