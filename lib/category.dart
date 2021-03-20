import 'package:flutter/material.dart';
import 'package:solution_challenge_2021/Forms/donor.dart';
import 'package:solution_challenge_2021/profile.dart';
import 'package:solution_challenge_2021/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Category extends StatefulWidget {
  final String type;

  const Category({Key key, this.type}) : super(key: key);
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
      drawer: CustomDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text('Categories'),
        centerTitle: true,
        actions: [AccountButton()],
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
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DonorDetails(
                                      type: widget.type,
                                      category: snapshot
                                          .data.docs[index]['name']
                                          .toString(),
                                    )));
                      },
                      child: Material(
                          borderRadius: BorderRadius.circular(20),
                          // elevation: 25,
                          color: Colors.pink,
                          child: Container(
                              height: 50,
                              width: 50,
                              child: Center(
                                  child: Text(
                                snapshot.data.docs[index]['name'],
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )))),
                    ),
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
