import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // Explicit
  double myPadding = 20.0;
  String nameString, emailString, passwordString;
  final formKey = GlobalKey<FormState>();

  // Method
  Widget showHead() {
    return Container(
      padding: EdgeInsets.only(left: myPadding),
      alignment: Alignment.centerLeft,
      child: Text(
        'Register',
        style: TextStyle(
          fontSize: 48.0,
          fontWeight: FontWeight.bold,
          color: Colors.green[700],
        ),
      ),
    );
  }

  Widget nameText() {
    return Container(
      padding: EdgeInsets.only(left: myPadding, right: myPadding),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'Name :',
          icon: Icon(
            Icons.perm_identity,
            size: 36.0,
          ),
        ),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Please Fill Name in Blank';
          }
        },
      ),
    );
  }

  Widget emailText() {
    return Container(
      padding: EdgeInsets.only(left: myPadding, right: myPadding),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: 'Email :',
          icon: Icon(
            Icons.email,
            size: 36.0,
          ),
        ),validator: (String value){
          if (!((value.contains('@')) && (value.contains('.')))) {
            return 'Please Type Email Format';
          }
        },
      ),
    );
  }

  Widget passwordText() {
    return Container(
      padding: EdgeInsets.only(left: myPadding, right: myPadding),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'Password :',
          icon: Icon(
            Icons.lock,
            size: 36.0,
          ),
        ),validator: (String value){
          if (value.length < 6) {
            return 'More 6 Charactor';
          }
        },
      ),
    );
  }

  Widget uploadButton() {
    return IconButton(
      icon: Icon(Icons.cloud_upload),
      onPressed: () {
        print('You Click Upload');
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: Text('Sign Up'),
        actions: <Widget>[uploadButton()],
      ),
      body: Form(key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            showHead(),
            nameText(),
            emailText(),
            passwordText(),
          ],
        ),
      ),
    );
  }
}
