import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const List<String> jobs = [
  'Shower Installation',
  'Toilet removal',
  'Gutter Cleaning',
  'Sink Faucet Upgrade',
  'Replace Garbage Dispossal',
  'Shower Installation',
  'Toilet removal',
  'Gutter Cleaning',
  'Sink Faucet Upgrade'
];

const List<String> dayMap = [
  'Wednesday',
  'Saturday',
  'Sunday',
  'Monday',
  'Friday',
  'Saturday',
  'Monday',
  'Tuesday',
  'Wednesday'
];

const List<String> monthMap = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December'
];


class JobsDay extends StatelessWidget {
  const JobsDay({
    Key? key,
    required this.day,
    required this.dayOfTheWeek,
    required this.jobName,
  }) : super(key: key);

  final int day;
  final String dayOfTheWeek;
  final String jobName;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          color: Colors.blue,
          border: Border.all(color: Colors.black)),
      width: 90.0,
      height: 90.0,
      // color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: <Widget> [
              SizedBox(
                width: 80,
                child: Column(
                  children: <Widget> [
                    Text(
                      '$day',
                      style: Theme.of(context).textTheme.headline2,
                      ),
                    Text(dayOfTheWeek),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                    child: VerticalDivider(
                      color: Colors.black,
                      thickness: 2,
                    ),
                  ),
              Text(
                jobName,
                style: const TextStyle(fontSize: 25)),
            ],
          ),
        ],
      ),
    );
  }
}

class Jobs extends StatelessWidget {
  const Jobs({Key? key}) : super(key: key);

  static Widget createDay(int day) {
    return JobsDay(
      day: day,
      dayOfTheWeek: 'Monday',
      jobName: 'Shower Installation'
    );
  }

  static String formatDate(DateTime date) {
    return monthMap[date.month];
  }

  static DateTime now = DateTime.now();
  static String dateNumAsString = DateFormat('dd').format(now);
  static int dateNum = int.parse(dateNumAsString);
  static String monthNumAsString = DateFormat('MM').format(now);
  static int monthNum = int.parse(monthNumAsString);
  static String yearNumAsString = DateFormat('yyyy').format(now);
  static int yearNum = int.parse(yearNumAsString);
  static int dayNum = now.weekday;

  static List<int> products = [
    3,
    6,
    7,
    8,
    12,
    13,
    22,
    23,
    24
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          monthMap[monthNum - 1],
          style: const TextStyle(
            fontSize: 40,
            fontStyle: FontStyle.italic),
          textAlign: TextAlign.start,
        ),
        const Divider(
          color: Colors.black,
          height: 2,
          thickness: 2,
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: SizedBox(
                height: MediaQuery.of(context).size.height - 161,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: products.length,
                  itemBuilder: (BuildContext ctxt, int index) => JobsDay(
                    day: products[index],
                    dayOfTheWeek: dayMap[index % dayMap.length],
                    jobName: jobs[index],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
