import 'package:flutter/material.dart';
import 'package:solution_challenge_2021/category.dart';
import 'package:solution_challenge_2021/widgets.dart';

class Postnew extends StatefulWidget {
  @override
  _PostnewState createState() => _PostnewState();
}

class _PostnewState extends State<Postnew> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Post'),
        centerTitle: true,
        backgroundColor: Colors.pink,
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
      drawer: drawer(context),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: GestureDetector(
              onTap: () {
                print('Donate');
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Category()));
              },
              child: Material(
                child: Container(
                  height: 100,
                  width: 350,
                  child: Center(
                      child: Text(
                    'Donate',
                    style: TextStyle(fontSize: 50),
                  )),
                ),
                elevation: 15,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                print('Request Donation');
              },
              child: Material(
                child: Container(
                  height: 100,
                  width: 350,
                  child: Center(
                      child: Text(
                    'Request Donation',
                    style: TextStyle(fontSize: 40),
                  )),
                ),
                elevation: 15,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
