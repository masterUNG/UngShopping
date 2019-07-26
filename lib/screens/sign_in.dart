import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ung_shopping/screens/my_service.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // Explicit
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();
  String emailString, passwordString;

  // Method
  Widget signInButton() {
    return Container(
      padding: EdgeInsets.only(left: 30.0, right: 30.0),
      child: RaisedButton(
        color: Colors.green[700],
        child: Text(
          'Sign In',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          formKey.currentState.save();
          checkAuthen();
        },
      ),
    );
  }

  Future<void> checkAuthen() async {
    await firebaseAuth
        .signInWithEmailAndPassword(
            email: emailString, password: passwordString)
        .then((response) {
          var homeRoute = MaterialPageRoute(builder: (BuildContext context) => MyService());
          Navigator.of(context).pushAndRemoveUntil(homeRoute, (Route<dynamic> route) => false);
        });
  }

  Widget emailText() {
    return Container(
      padding: EdgeInsets.only(left: 30.0, right: 30.0),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintStyle: TextStyle(color: Colors.red),
          hintText: 'you@abc.com',
          labelText: 'Email :',
          helperText: 'you@email.com',
        ),
        onSaved: (String value) {
          emailString = value;
        },
      ),
    );
  }

  Widget passwordText() {
    return Container(
      padding: EdgeInsets.only(left: 30.0, right: 30.0),
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Password :',
          helperText: 'More 6 Charactor',
        ),
        onSaved: (String value) {
          passwordString = value;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            emailText(),
            passwordText(),
            signInButton(),
          ],
        ),
      ),
    );
  }
}
