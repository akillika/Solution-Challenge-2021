import 'package:flutter/material.dart';
import 'package:solution_challenge_2021/category.dart';
import 'package:solution_challenge_2021/login.dart';
import 'package:solution_challenge_2021/main.dart';
import 'package:solution_challenge_2021/profile.dart';
import 'package:solution_challenge_2021/signin.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
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
                    "assets/drawer.png",
                    fit: BoxFit.scaleDown,
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
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => MyHomePage()));
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
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Category(
                          type: 'Donate',
                        )));
              },
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
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Category(
                          type: 'Request Donation',
                        )));
              },
              child: Text(
                'Request Donation',
                style: TextStyle(
                  fontFamily: 'Avenir',
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            // SizedBox(
            //   height: 45,
            // ),
            // Text(
            //   'About us',
            //   style: TextStyle(
            //     fontFamily: 'Avenir',
            //     fontSize: 24,
            //     fontWeight: FontWeight.w700,
            //   ),
            //   textAlign: TextAlign.center,
            // ),
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
                    'Developed by Akil & Madhavan',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class AccountButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => ProfilePage()));
        },
        child: Icon(
          Icons.account_circle,
          size: 26.0,
        ),
      ),
    );
  }
}

class NextButton extends StatelessWidget {
  final Function func;

  const NextButton({Key key, this.func}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: func,
      shape: StadiumBorder(),
      color: Colors.green,
      child: Text(
        'Next',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
