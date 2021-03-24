import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:solution_challenge_2021/splash.dart';

class Thankyou extends StatefulWidget {
  @override
  _ThankyouState createState() => _ThankyouState();
}

class _ThankyouState extends State<Thankyou> {
  final splashDelay = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadWidget();
  }

  _loadWidget() async {
    var _duration = Duration(seconds: splashDelay);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    SystemNavigator.pop(animated: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text('Thank you'),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 90,
              ),
              Text(
                'Thank you!!',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.pink,
                    fontWeight: FontWeight.bold),
              ),
              Image.asset('assets/logim.png'),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
