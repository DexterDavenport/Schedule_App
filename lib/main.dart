import 'package:flutter/material.dart';
import 'package:scheduler/pages/home_page.dart';
import 'package:scheduler/pages/jobs_page.dart';
import 'package:scheduler/contexts/themes.dart';
import 'package:scheduler/pages/settings_page.dart';
import 'components/navbar.dart';

void main() => runApp(const MyApp());

class EnterApp extends StatefulWidget {
  const EnterApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _EnterAppState();
}

class _EnterAppState extends State<EnterApp> {
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
    // const CalendarPage(),
    const JobsPage(),
    const SettingsPage(),
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

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Perfect Scheduler';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatefulWidget(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                // child: const Text(
                //   'TutorialKart',
                //   style: TextStyle(
                //       color: Colors.blue,
                //       fontWeight: FontWeight.w500,
                //       fontSize: 30),
                // )
            ),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Welcome',
                  style: TextStyle(fontSize: 20),
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Name',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                //forgot password screen
              },
              child: const Text(
                'Forgot Password',
              ),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('Login'),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const EnterApp()));
                  },
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Does not have account?'),
                TextButton(
                  child: const Text(
                    'Sign in',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                  },
                )
              ],
            ),
          ],
        ));
  }
}
