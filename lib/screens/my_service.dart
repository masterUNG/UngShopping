import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ung_shopping/screens/home.dart';
import 'package:ung_shopping/screens/page1.dart';
import 'package:ung_shopping/screens/page2.dart';
import 'package:ung_shopping/screens/page3.dart';

class MyService extends StatefulWidget {
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  // Explicit
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String displayNameStrin = '';
  Widget myWidget = Page1();

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
          showPage1(),
          showPage2(),
          showPage3(),
          mySignOut(),
        ],
      ),
    );
  }

  Widget headDrawer() {
    return DrawerHeader(
      decoration: BoxDecoration(
          gradient: RadialGradient(
        colors: [Colors.white, Colors.green],
        center: Alignment.topLeft,
        radius: 1.5,
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

  Widget mySignOut() {
    return ListTile(
      leading: Icon(
        Icons.exit_to_app,
      ),
      title: Text('SignOut & Exit'),
      onTap: () {
        processSignOut();
      },
    );
  }

  Widget showPage1() {
    return ListTile(
      leading: Icon(Icons.home),
      title: Text('Page 1'),
      onTap: () {
        setState(() {
          myWidget = Page1();
          Navigator.of(context).pop();
        });
      },
    );
  }

  Widget showPage2() {
    return ListTile(
      leading: Icon(Icons.android),
      title: Text('Page 2'),
      onTap: () {
        setState(() {
          myWidget = Page2();
          Navigator.of(context).pop();
        });
      },
    );
  }

  Widget showPage3() {
    return ListTile(
      leading: Icon(Icons.account_box),
      title: Text('Page 3'),
      onTap: () {
        setState(() {
          myWidget = Page3();
        });
        Navigator.of(context).pop();
      },
    );
  }

  Future<void> processSignOut() async {
    await firebaseAuth.signOut().then((response) {
      var homeRoute =
          MaterialPageRoute(builder: (BuildContext context) => Home());
      Navigator.of(context)
          .pushAndRemoveUntil(homeRoute, (Route<dynamic> route) => false);
    });
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
      body: myWidget,
      drawer: myDrawerMenu(),
    );
  }
}
