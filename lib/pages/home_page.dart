import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:syncfusion_flutter_calendar/calendar.dart';

// ignore: constant_identifier_names
const List<String> Date31 = <String>[
    'Date', 
    '1', '2', '3', '4', '5', '6', '7', '8', '9', '10',
    '11', '12', '13', '14', '15', '16', '17', '18', '19', '20',
    '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31'];

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
              MaterialPageRoute(builder: (context) => const AddEvent()),
            );
          },
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
      color: Colors.green,
      recurrenceRule: 'FREQ=DAILY;COUNT=10',
      isAllDay: true));

  return meetings;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}

class AddEvent extends StatelessWidget {
  const AddEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Event'),
      ),
      body: Column(
        children: [ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Create'),
        ),
        const DateButton()
        ]
      ),
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
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Return'),
        ),
      ),
    );
  }
}

class DateButton extends StatefulWidget {
  const DateButton({super.key});

  @override
  State<DateButton> createState() => _DateButtonState();
}

class _DateButtonState extends State<DateButton> {
  String dropdownValue = Date31.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
            
          dropdownValue = value!;
        });
      },
      items: Date31.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
