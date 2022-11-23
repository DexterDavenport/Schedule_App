import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scheduler/main.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:syncfusion_flutter_calendar/calendar.dart';

// ignore: constant_identifier_names
const List<int> MonthList = <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];

// ignore: constant_identifier_names
const List<int> DayList = <int>[
  1,
  2,
  3,
  4,
  5,
  6,
  7,
  8,
  9,
  10,
  11,
  12,
  13,
  14,
  15,
  16,
  17,
  18,
  19,
  20,
  21,
  22,
  23,
  24,
  25,
  26,
  27,
  28,
  29,
  30,
  31
];

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
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Account()),
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
                // todayHighlightColor: Colors.blueGrey,
                cellBorderColor: Theme.of(context).backgroundColor,
                view: CalendarView.month,
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddEvent()),
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

// ignore: must_be_immutable
class AddEvent extends StatelessWidget {
  final _textController = TextEditingController();
  String jobTitle = '';
  AddEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Event'),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        TextField(
          controller: _textController,
          decoration: InputDecoration(
            hintText: 'Event Title',
            border: const OutlineInputBorder(),
            suffixIcon: IconButton(
                onPressed: () {
                  _textController.clear();
                },
                icon: const Icon(Icons.clear)),
          ),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text(
                      'Month',
                      style: TextStyle(fontSize: 25),
                    ),
                    const MonthButton()
                  ]),
              Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text(
                      'Day',
                      style: TextStyle(fontSize: 25),
                    ),
                    const DayButton()
                  ])
            ]),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Create'),
        ),
      ]),
    );
  }
}

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Info'),
      ),
      body: Column(children: [
        ElevatedButton(
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
            // ignore: use_build_context_synchronously
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MyApp()));
          },
          child: const Text('Sign Out'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Return'),
        ),
      ]),
    );
  }
}

class MonthButton extends StatefulWidget {
  const MonthButton({super.key});

  @override
  State<MonthButton> createState() => _MonthButtonState();
}

class _MonthButtonState extends State<MonthButton> {
  int dropdownValue = 1;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
        value: dropdownValue,
        icon: const Icon(Icons.arrow_downward),
        elevation: 16,
        style: const TextStyle(color: Colors.black),
        underline: Container(
          height: 2,
          color: Colors.black45,
        ),
        onChanged: (int? value) {
          // This is called when the user selects an item.
          setState(() {
            dropdownValue = value!;
          });
        },
        items: MonthList.map<DropdownMenuItem<int>>((int value) {
          return DropdownMenuItem<int>(
            value: value,
            child: Text(value.toString()),
          );
        }).toList());
  }
}

class DayButton extends StatefulWidget {
  const DayButton({super.key});

  @override
  State<DayButton> createState() => _DayButtonState();
}

class _DayButtonState extends State<DayButton> {
  int dropdownValue = 1;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
        value: dropdownValue,
        icon: const Icon(Icons.arrow_downward),
        elevation: 16,
        style: const TextStyle(color: Colors.black),
        underline: Container(
          height: 2,
          color: Colors.black45,
        ),
        onChanged: (int? value) {
          // This is called when the user selects an item.
          setState(() {
            dropdownValue = value!;
          });
        },
        items: DayList.map<DropdownMenuItem<int>>((int value) {
          return DropdownMenuItem<int>(
            value: value,
            child: Text(value.toString()),
          );
        }).toList());
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
      color: Colors.green,
      recurrenceRule: 'FREQ=DAILY;COUNT=10',
      isAllDay: true));

  return meetings;
}
