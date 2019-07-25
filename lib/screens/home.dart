import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ung_shopping/screens/my_service.dart';
import 'package:ung_shopping/screens/sign_in.dart';
import 'package:ung_shopping/screens/sign_up.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Explicit
  double myWidth = 200.0;

  // Method

  @override
  void initState() { 
    super.initState();
    checkStatus();
  }

  Future<void> checkStatus()async{

    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    FirebaseUser firebaseUser = await firebaseAuth.currentUser();

    if (firebaseUser != null) {
      
        var serviceRoute = MaterialPageRoute(builder: (BuildContext context) => MyService());
        Navigator.of(context).pushAndRemoveUntil(serviceRoute, (Route<dynamic> route) => false);

    }

  }


  Widget showAppName() {
    return Container(
      margin: EdgeInsets.only(bottom: 8.0),
      child: Text(
        'Ung Shopping',
        style: TextStyle(
          fontSize: 48.0,
          color: Colors.pink[700],
          fontWeight: FontWeight.bold,
          fontFamily: 'ButterflyKids',
        ),
      ),
    );
  }

  Widget signInButton() {
    return Container(
      child: FlatButton(
        color: Colors.green[700],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Text(
          'Sign In',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          print('You Click SignIn');

          var signInRoute =
              MaterialPageRoute(builder: (BuildContext context) => SignIn());
          Navigator.of(context).push(signInRoute);
        },
      ),
    );
  }

  Widget signUpButton() {
    return Container(
      child: OutlineButton(
        borderSide: BorderSide(
          color: Colors.green[700],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Text('Sign Up'),
        onPressed: () {
          var signUpRoute = MaterialPageRoute(builder: (BuildContext context) => SignUp());
          Navigator.of(context).push(signUpRoute);
        },
      ),
    );
  }

  Widget showButton() {
    return Container(
      width: 250.0,
      child: Row(
        children: <Widget>[
          Expanded(
            child: signInButton(),
          ),
          Expanded(
            child: signUpButton(),
          ),
        ],
      ),
    );
  }

  Widget showLogo() {
    return Container(
      margin: EdgeInsets.only(bottom: 30.0),
      width: 120.0,
      height: 120.0,
      child: Image.asset('images/logo.png'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [Colors.white, Colors.yellow[600]],
            radius: 1.0,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            showLogo(),
            showAppName(),
            showButton(),
          ],
        ),
        alignment: Alignment.center,
      ),
    );
  }
}
