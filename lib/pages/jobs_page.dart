import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scheduler/provider/event_provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:scheduler/pages/event_editing_page.dart';
import 'account_info_page.dart';
import 'contexts/event_data_source.dart';
// ignore: unused_import
import 'contexts/globals.dart' as globals;

class JobsPage extends StatefulWidget {
  const JobsPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<JobsPage> createState() => _JobsPageState();
}

class _JobsPageState extends State<JobsPage> {
  CalendarView calendarView = CalendarView.month;
  CalendarController calendarController = CalendarController();
  get style => null;
  @override
  Widget build(BuildContext context) {
    final events = Provider.of<EventProvider>(context).events;
    var icon = const Icon(Icons.account_circle_outlined);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jobs"),
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AccountInfo()),
            );
          },
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
            view: CalendarView.schedule,
            controller: calendarController,
            dataSource: EventDataSource(events),
          )),
          FloatingActionButton(
            // style: buttonStyle,
            // Within the `FirstRoute` widget
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const EventEditingPage()),
              );
            },
            child: const Text('+'),
          ),
        ],
      ),
    );
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}