import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:solution_challenge_2021/signin.dart';
import 'package:solution_challenge_2021/widgets.dart';

import 'login.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: CustomDrawer(),
        appBar: AppBar(
          title: Text('Profile'),
          centerTitle: true,
          actions: [AccountButton()],
        ),
        backgroundColor: Colors.white,
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 45,
            ),
            CircleAvatar(
              radius: 70.0,
              backgroundImage: NetworkImage(imageUrl),
              backgroundColor: Colors.transparent,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              name,
              style: TextStyle(fontSize: 40),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '7904748133',
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              email,
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: GestureDetector(
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
                  child: Material(
                    color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        color: Colors.red,
                        height: 30,
                        // width: 350,
                        child: Center(
                            child: Text(
                          'Logout',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        )),
                      ),
                    ),
                    elevation: 5,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
            ),
          ],
        )));
  }
}
