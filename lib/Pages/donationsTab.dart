import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class DonationsTab extends StatefulWidget {
  @override
  _DonationsTabState createState() => _DonationsTabState();
}

class _DonationsTabState extends State<DonationsTab> {
  getDonations() {
    return FirebaseFirestore.instance.collection('donation').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: getDonations(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data.size,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () async {
                      var url =
                          'tel:+91${snapshot.data.docs[index]['donorNumber']}';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        Fluttertoast.showToast(msg: 'Try Again Later!!');
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      width: double.maxFinite,
                      child: new Card(
                        elevation: 3,
                        child: new Container(
                          padding: new EdgeInsets.all(10.0),
                          child: new Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  new Text(
                                    snapshot.data.docs[index]['item']
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.pink),
                                  ),
                                  Text('Posted on : ' +
                                      snapshot.data.docs[index]['time']
                                          .toString()),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                snapshot.data.docs[index]['type'],
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              new Text(snapshot.data.docs[index]['desc']),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Available till : " +
                                        snapshot.data.docs[index]['expiry'],
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.location_on_outlined),
                                      Text(
                                        snapshot.data.docs[index]['city'],
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
