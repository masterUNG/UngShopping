import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyService extends StatefulWidget {
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  // Explicit
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String displayNameStrin = '';

  // Method
  @override
  void initState() {
    super.initState();
    findDisplayName();
  }

  Future<void> findDisplayName() async {
    FirebaseUser firebaseUser = await firebaseAuth.currentUser();
    setState(() {
      displayNameStrin = firebaseUser.displayName;
    });
    print('Name = $displayNameStrin');
  }

  Widget myDrawerMenu() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          headDrawer(),
        ],
      ),
    );
  }

  Widget headDrawer() {
    return DrawerHeader(
      decoration: BoxDecoration(
          gradient: RadialGradient(
        colors: [Colors.white, Colors.green],
        center: Alignment.topLeft,radius: 1.5,
      )),
      child: Column(
        children: <Widget>[
          showLogo(),
          showTopTitle(),
          showBottonTitle(),
        ],
      ),
    );
  }

  Widget showLogo() {
    return Container(
      alignment: Alignment.centerLeft,
      height: 80.0,
      child: Image.asset('images/logo.png'),
    );
  }

  Widget showTitle() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        showTopTitle(),
        showBottonTitle(),
      ],
    );
  }

  Widget showTopTitle() {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text('My Service'),
    );
  }

  Widget showBottonTitle() {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        'Login by $displayNameStrin',
        style: TextStyle(
          fontSize: 14.0,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: showTitle(),
      ),
      body: Text('body'),
      drawer: myDrawerMenu(),
    );
  }
}
