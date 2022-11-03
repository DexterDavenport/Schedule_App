import 'package:flutter/material.dart';
import 'package:scheduler/components/calandar.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calendar"),
        leading: GestureDetector(
          onTap: () { /* Write listener code here */ },
          child: const Icon(
            Icons.menu,  // add custom icons also
          ),
        ),
      ),
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const Calendar(),
        ],
      ),
    );
  }
}
