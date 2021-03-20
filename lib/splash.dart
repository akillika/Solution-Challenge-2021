import 'dart:async';
import 'package:flutter/material.dart';
import 'package:solution_challenge_2021/login.dart';
import 'package:solution_challenge_2021/main.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final splashDelay = 3;

  @override
  void initState() {
    super.initState();
    _loadWidget();
  }

  _loadWidget() async {
    var _duration = Duration(seconds: splashDelay);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    signed
        ? Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => MyHomePage()))
        : Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink,
        body: Center(
            child: CircularProgressIndicator(
          backgroundColor: Colors.white,
        )));
  }
}

String greetings() {
  var now;
  now = DateTime.now().hour;
  if (now < 12) {
    return 'Good morning, ';
  } else if (now < 17) {
    return 'Good afternoon,';
  } else {
    return 'Good evening,';
  }
}
