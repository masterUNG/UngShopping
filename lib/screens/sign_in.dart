import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // Explicit

  // Method
  Widget emailText() {
    return TextFormField(
      decoration: InputDecoration(hintStyle: TextStyle(color: Colors.red),
        hintText: 'ABC',
        labelText: 'Email :',
        helperText: 'you@email.com',
      ),
    );
  }

  Widget passwordText() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Password :',
        helperText: 'More 6 Charactor',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          emailText(),
          passwordText(),
        ],
      ),
    );
  }
}
