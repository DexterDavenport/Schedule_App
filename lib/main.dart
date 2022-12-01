import 'package:flutter/material.dart';
import 'package:scheduler/pages/create_account_page.dart';
import 'package:scheduler/pages/forgot_password_page.dart';
import 'package:scheduler/pages/home_page.dart';
// import 'package:scheduler/pages/jobs_page.dart';
import 'package:scheduler/pages/contexts/themes.dart';
import 'package:scheduler/pages/settings_page.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scheduler/provider/event_provider.dart';
import 'components/navbar.dart';
import 'pages/contexts/firebase_options.dart';
 import 'package:provider/provider.dart'; 
import 'pages/contexts/globals.dart' as globals;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

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
    // const JobsPage(),
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
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) => EventProvider(),
    child: MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: MyStatefulWidget(),
      ),
      debugShowCheckedModeBanner: false,
      )
    );
  }


class MyStatefulWidget extends StatefulWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  get user => _auth.currentUser;

  MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  // String? email;
  // String? password;

  @override
  Widget build(BuildContext context) {
    // User? user = FirebaseAuth.instance.currentUser;
    return WillPopScope(
        onWillPop: () async => false,
        child: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
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
                controller: email,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: password,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ForgotPassword()));
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
                  onPressed: () async {
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: email.text, password: password.text);
                    globals.userEmail = email.text;
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const EnterApp()));
                  },
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Don\'t have account?'),
                TextButton(
                  child: const Text(
                    'Create Account',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CreateAccount()),
                    );
                  },
                )
              ],
            ),
          ],
        ));
  }
}
