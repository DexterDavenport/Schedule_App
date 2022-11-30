import 'package:flutter/material.dart';
import 'home_page.dart';
import 'contexts/globals.dart' as globals;
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

class JobsDay extends StatefulWidget {
  const JobsDay({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _JobsDayState();
}

class _JobsDayState extends State<JobsDay> {
  final _textController = TextEditingController();
  String jobTitle = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Event Page'),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        TextField(
          controller: _textController,
          decoration: InputDecoration(
            hintText: 'Email',
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
            globals.getAppointments();
            Navigator.pop(context);
          },
          child: const Text('Create'),
        ),
      ]),
    );
  }
}
