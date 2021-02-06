import 'package:flutter/material.dart';
import 'package:solution_challenge_2021/main.dart';
import 'package:solution_challenge_2021/widgets.dart';

class Posted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff12c06a),
      appBar: AppBar(
        title: Text('Posted'),
        centerTitle: true,
        actions: [AccountButton()],
      ),
      drawer: CustomDrawer(),
      body: Column(
        children: [
          Image.asset('assets/tick.gif'),
          Text(
            "Posted!",
            style: TextStyle(color: Colors.white, fontSize: 35),
          ),
          SizedBox(
            height: 25,
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil<dynamic>(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (BuildContext context) => MyHomePage(),
                ),
                (route) =>
                    false, //if you want to disable back feature set to false
              );
            },
            child: const Text('Go to home', style: TextStyle(fontSize: 20)),
          ),
        ],
      ),
    );
  }
}
