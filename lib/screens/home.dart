import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Explicit
  double myWidth = 200.0;

  // Method
  Widget showAppName() {
    return Text(
      'Ung Shopping',
      style: TextStyle(
        fontSize: 24.0,
        color: Colors.pink[700],
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget signInButton() {
    return Container(width: myWidth,
      child: FlatButton(
        color: Colors.green[700],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Text(
          'Sign In',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {},
      ),
    );
  }

  Widget signUpButton() {
    return RaisedButton(
      child: Text('Sign Up'),
      onPressed: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            showAppName(),
            signInButton(),
            signUpButton(),
          ],
        ),
        alignment: Alignment.center,
      ),
    );
  }
}
