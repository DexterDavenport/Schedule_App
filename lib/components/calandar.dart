import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const List<String> dayMap = [
  'Sunday',
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday'
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

class CalendarDay extends StatelessWidget {
  const CalendarDay({
    Key? key,
    required this.day,
    required this.dayOfTheWeek,
  }) : super(key: key);

  final int day;
  final String dayOfTheWeek;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      color: Colors.blue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$day',
            style: Theme.of(context).textTheme.headline2,
          ),
          Text(dayOfTheWeek),
        ],
      ),
    );
  }
}

class Calendar extends StatelessWidget {
  const Calendar({Key? key}) : super(key: key);

  static Widget createDay(int day) {
    return CalendarDay(
      day: day,
      dayOfTheWeek: 'Monday',
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
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: products.length,
                  itemBuilder: (BuildContext ctxt, int index) => CalendarDay(
                    day: products[index],
                    dayOfTheWeek: dayMap[index % dayMap.length],
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
