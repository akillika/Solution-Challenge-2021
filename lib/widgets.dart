import 'package:flutter/material.dart';
import 'package:solution_challenge_2021/login.dart';
import 'package:solution_challenge_2021/main.dart';
import 'package:solution_challenge_2021/signin.dart';

drawer(BuildContext context) {
  return Drawer(
    child: Column(
      children: <Widget>[
        SizedBox(
          height: 30,
        ),
        DrawerHeader(
          child: Container(
              height: 142,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                "assets/dsclogo.png",
              )),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (BuildContext context) => MyApp()));
          },
          child: Text(
            'Dashboard',
            style: TextStyle(
              fontFamily: 'Avenir',
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 45,
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            'Donate',
            style: TextStyle(
              fontFamily: 'Avenir',
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 45,
        ),
        Text(
          'Ask',
          style: TextStyle(
            fontFamily: 'Avenir',
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 45,
        ),
        Text(
          'About us',
          style: TextStyle(
            fontFamily: 'Avenir',
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 45,
        ),
        GestureDetector(
          onTap: () {
            signOutGoogle().then((result) {
              Navigator.pushAndRemoveUntil<dynamic>(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (BuildContext context) => LoginPage(),
                ),
                (route) => false,
              );
            });
          },
          child: Text(
            'Logout',
            style: TextStyle(
              fontFamily: 'Avenir',
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 45,
        ),
        Expanded(
            child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 65,
            width: MediaQuery.of(context).size.width,
            color: Colors.pink,
            child: Center(
              child: Text(
                'v1.0.1',
                style: TextStyle(
                  fontFamily: 'Avenir',
                  fontSize: 20,
                  color: const Color(0xffffffff),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ))
      ],
    ),
  );
}
