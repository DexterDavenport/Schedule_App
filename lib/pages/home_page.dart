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
  CalendarView calendarView = CalendarView.month;
  CalendarController calendarController = CalendarController();

  get style => null;
  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
        disabledBackgroundColor: Theme.of(context).colorScheme.primary,
        disabledForegroundColor: Colors.black54,
        textStyle: const TextStyle(fontSize: 20));
    var icon = const Icon(Icons.account_circle_outlined);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        leading: GestureDetector(
          onTap: () {icon = const Icon(Icons.account_circle);},
          child: icon,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: SfCalendar(
                cellBorderColor: Theme.of(context).backgroundColor,
                view: CalendarView.day,
                allowedViews: const [
                  CalendarView.month,
                  CalendarView.week,
                  CalendarView.day,
                  // CalendarView.timelineDay,
                  // CalendarView.timelineWeek,
                  // CalendarView.timelineWorkWeek,
                  // CalendarView.timelineMonth,
                  // CalendarView.schedule
                ],
                controller: calendarController,
                dataSource: MeetingDataSource(getAppointments())),
          ),
          ElevatedButton(
            style: buttonStyle,
            onPressed: null,
            child: const Text('+'),
          ),
        ],
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
