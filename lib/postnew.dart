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
        actions: [AccountButton()],
      ),
      backgroundColor: Colors.white,
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/posts.png",
                  height: orientation == Orientation.landscape
                      ? MediaQuery.of(context).size.height * 0.47
                      : null,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      print('Donate');
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Category(
                                type: 'Donate',
                              )));
                    },
                    child: Material(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: orientation == Orientation.landscape
                              ? MediaQuery.of(context).size.height * 0.05
                              : 30,
                          width: orientation == Orientation.landscape
                              ? MediaQuery.of(context).size.width * 0.5
                              : null,
                          child: Center(
                              child: Text(
                            'Donate',
                            style: TextStyle(fontSize: 20),
                          )),
                        ),
                      ),
                      elevation: 5,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      print('Request Donation');
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Category(
                                type: 'Request Donation',
                              )));
                    },
                    child: Material(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: orientation == Orientation.landscape
                              ? MediaQuery.of(context).size.height * 0.05
                              : 30,
                          width: orientation == Orientation.landscape
                              ? MediaQuery.of(context).size.width * 0.5
                              : null,
                          child: Center(
                              child: Text(
                            'Request Donation',
                            style: TextStyle(fontSize: 20),
                          )),
                        ),
                      ),
                      elevation: 15,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
