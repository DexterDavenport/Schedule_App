import 'package:flutter/material.dart';

const List<String> dayMap = [
  'Sunday',
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
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

class Calendar extends StatelessWidget {
  const Calendar({Key? key}) : super(key: key);

  static DateTime now = DateTime.now();
  static String month = monthMap[(now.month - 1) % monthMap.length];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          month,
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
        GridView.builder(
          itemCount: 31,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemBuilder: (BuildContext ctxt, int index) => CalendarDay(
            dayNum: index + 1,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
          ),
        ),
      ],
    );
  }
}

class CalendarDay extends StatelessWidget {
  const CalendarDay({
    Key? key,
    required this.dayNum,
  }) : super(key: key);

  final int dayNum;

  @override
  Widget build(BuildContext context) {
    String dayOfWeek = dayMap[dayNum % 7];

    return Container(
      margin: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Center(
        child: Text(
          '$dayNum\n$dayOfWeek',
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool alternate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: const [
          Calendar(),
        ],
      ),
    );
  }
}
