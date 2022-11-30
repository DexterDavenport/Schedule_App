import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password Page'),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        const Spacer(),
        TextField(
          obscureText: false,
          controller: email,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Email',
          ),
        ),
        const Spacer(),
        ElevatedButton(
          onPressed: () async {
              await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);

              // ignore: use_build_context_synchronously
              Navigator.pop(context);
            },
          child: const Text('Send Email'),
        ),
        const Spacer(),
        const Spacer(),
        const Spacer(),
        const Spacer(),
      ]),
    );
  }
}


