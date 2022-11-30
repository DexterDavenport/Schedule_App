import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:scheduler/pages/create_event_page.dart';
import 'account_info_page.dart';
import 'contexts/globals.dart' as globals;

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
                view: CalendarView.month,
                allowedViews: const [
                  CalendarView.month,
                  CalendarView.week,
                  CalendarView.day,
                ],
                controller: calendarController,
                dataSource: globals.getAppointments()),
          ),
          ElevatedButton(
            style: buttonStyle,
            // Within the `FirstRoute` widget
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const JobsDay()),
              );
            },
            child: const Text('+'),
          ),
        ],
      ),
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

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}

