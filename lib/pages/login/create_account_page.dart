import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  TextEditingController email = TextEditingController();
  TextEditingController emailConfirm = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passwordConfirm = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Account Page'),
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
        TextField(
          obscureText: false,
          controller: emailConfirm,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Confirm Email',
          ),
        ),
        const Spacer(),
        TextField(
          obscureText: true,
          controller: password,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Password',
          ),
        ),
        const Spacer(),
        TextField(
          obscureText: true,
          controller: passwordConfirm,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Confirm Password',
          ),
        ),
        const Spacer(),
        ElevatedButton(
          onPressed: () async {
            if (email.text == emailConfirm.text || password.text == passwordConfirm.text) {
              await FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: email.text, password: password.text);

              // ignore: use_build_context_synchronously
              Navigator.pop(context);
            }
          },
          child: const Text('Create Account'),
        ),
        const Spacer(),
        const Spacer(),
        const Spacer(),
        const Spacer(),
      ]),
    );
  }
}
