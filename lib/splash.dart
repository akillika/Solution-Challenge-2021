import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:solution_challenge_2021/main.dart';
import 'package:solution_challenge_2021/signin.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    signInWithGoogle().then((result) {
      print(name);
      if (result != null) {
        FirebaseFirestore.instance
            .collection('Users')
            .doc(uid)
            .set({"Email": email}, SetOptions(merge: true));
        Navigator.pushAndRemoveUntil<dynamic>(
          context,
          MaterialPageRoute<dynamic>(
            builder: (BuildContext context) => MyHomePage(),
          ),
          (route) => false,
        );
      }
    });
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
