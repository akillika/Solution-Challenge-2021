import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:solution_challenge_2021/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'main.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(context),
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () => Scaffold.of(context).openDrawer(),
              child: Icon(
                Icons.account_circle,
                size: 26.0,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              "assets/logim.png",
            ),

            new Container(
              margin: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 5.0),
              child: new RaisedButton(
                  padding: EdgeInsets.only(top: 3.0,bottom: 3.0,left: 3.0),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (context) => MyApp()));
                  },
                  child: new Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new Image.asset(
                        'assets/google.png',
                        height: 48.0,
                      ),
                      new Container(
                          padding: EdgeInsets.only(left: 10.0,right: 10.0),
                          child: new Text("Sign in with Google",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
                      ),
                    ],
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
