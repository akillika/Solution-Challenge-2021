import 'package:flutter/material.dart';
import 'package:solution_challenge_2021/profile.dart';
import 'package:solution_challenge_2021/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  CollectionReference categories =
      FirebaseFirestore.instance.collection('categories');
  getCategories() {
    return categories.snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(context),
      appBar: AppBar(
        title: Text('Categories'),
        centerTitle: true,
        actions: [
          Padding(
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
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: StreamBuilder(
        stream: getCategories(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            return GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: snapshot.data.size,
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.white,
                  child: GridTile(
                      child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Material(
                        borderRadius: BorderRadius.circular(20),
                        // elevation: 25,
                        color: Colors.pink,
                        child: Container(
                            height: 100,
                            width: 100,
                            child: Center(
                                child: Text(snapshot.data.docs[index]['name'])))),
                  )),
                );
              },
            );
          }
        },
      ),
    );
  }
}
