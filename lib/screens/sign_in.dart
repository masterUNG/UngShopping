import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // Explicit

  // Method
  Widget emailText() {
    return Container(
      padding: EdgeInsets.only(left: 30.0, right: 30.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintStyle: TextStyle(color: Colors.red),
          hintText: 'ABC',
          labelText: 'Email :',
          helperText: 'you@email.com',
        ),
      ),
    );
  }

  Widget passwordText() {
    return Container(
      padding: EdgeInsets.only(left: 30.0, right: 30.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'Password :',
          helperText: 'More 6 Charactor',
        ),
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
