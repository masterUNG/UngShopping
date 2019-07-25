import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ung_shopping/screens/my_service.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // Explicit
  double myPadding = 20.0;
  String nameString, emailString, passwordString;
  final formKey = GlobalKey<FormState>();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

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
        onSaved: (String value) {
          nameString = value;
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
        ),
        validator: (String value) {
          if (!((value.contains('@')) && (value.contains('.')))) {
            return 'Please Type Email Format';
          }
        },
        onSaved: (String value) {
          emailString = value;
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
        ),
        validator: (String value) {
          if (value.length < 6) {
            return 'More 6 Charactor';
          }
        },
        onSaved: (String value) {
          passwordString = value;
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
          print(
              'name = $nameString, email = $emailString, password = $passwordString');
          registerUser();
        }
      },
    );
  }

  Future<void> registerUser() async {
    await firebaseAuth
        .createUserWithEmailAndPassword(
            email: emailString, password: passwordString)
        .then((response) {
      print('Register Success');
      setupDisplayName();
    }).catchError((response) {
      print('Error = ${response.toString()}');
      String titleString = response.code;
      String messageString = response.message;
      myAlert(titleString, messageString);
    });
  }

  Future<void> setupDisplayName() async {

    FirebaseUser firebaseUser = await firebaseAuth.currentUser();
    UserUpdateInfo userUpdateInfo = UserUpdateInfo();
    userUpdateInfo.displayName = nameString;
    firebaseUser.updateProfile(userUpdateInfo);

    var myServiceRoute = MaterialPageRoute(builder: (BuildContext context) => MyService());
    Navigator.of(context).pushAndRemoveUntil(myServiceRoute, (Route<dynamic> route) => false);

  }

  void myAlert(String titleString, String messageString) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: ListTile(
              leading: Icon(
                Icons.android,
                size: 48.0,
                color: Colors.green,
              ),
              title: Text(titleString),
            ),
            content: Text(messageString),
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: Text('Sign Up'),
        actions: <Widget>[uploadButton()],
      ),
      body: Form(
        key: formKey,
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
