import 'package:flutter/material.dart';
import 'package:scheduler/pages/home_page.dart';
import 'package:scheduler/pages/calendar_page.dart';
import 'package:scheduler/pages/jobs_page.dart';
import 'package:scheduler/contexts/themes.dart';
import 'components/navbar.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    currentTheme.addListener(() {
      setState(() {});
    });
  }

  int _pageIndex = 0;

  static List<Widget> pages = [
    const MyHomePage(title: 'Home Page'),
    const CalendarPage(),
    const JobsPage(),
  ];

  void _changeState(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: pages[_pageIndex],
        bottomNavigationBar: Navbar(callback: _changeState),
      ),
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      themeMode: currentTheme.currentTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
