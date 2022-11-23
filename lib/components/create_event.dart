import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';



List<Appointment> getAppointments(startTime, endTime, subject) {
  List<Appointment> meetings = <Appointment>[];
  // // final DateTime today = DateTime.now();
  // final DateTime startTime =
  //     DateTime(2022, 11, 14, 9, 0, 0);
  // final DateTime endTime = startTime.add(const Duration(hours: 2));

  meetings.add(Appointment(
    startTime: startTime,
    endTime: endTime,
    subject: "Test",
    color: Colors.lightBlue,
  ));
  return meetings;
}