import 'package:flutter/material.dart';
import 'package:scheduler/components/jobs.dart';

class JobsPage extends StatelessWidget {
  const JobsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jobs Page"),
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
          const Jobs(),
        ],
      ),
    );
  }
}
