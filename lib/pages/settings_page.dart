import 'package:flutter/material.dart';
import 'contexts/themes.dart';
// ignore: unused_import
import './components/globals.dart' as globals;

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void toggleTheme(bool isDarkTheme) {
    currentTheme.toggleTheme();

    setState(() {
      _isDarkTheme = isDarkTheme;
    });
  }

  bool _isDarkTheme = currentTheme.isDarkTheme;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text('Dark Theme'),
                Switch(
                  thumbColor: MaterialStateProperty.all<Color>(
                      Theme.of(context).colorScheme.primary),
                  trackColor: MaterialStateProperty.all<Color>(Colors.grey),
                  value: _isDarkTheme,
                  onChanged: toggleTheme,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
