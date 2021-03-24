import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

import '../main.dart';

class DetailsPage extends StatefulWidget {
  final AsyncSnapshot snapshot;
  final int index;

  const DetailsPage({Key key, this.snapshot, this.index}) : super(key: key);
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  void initState() {
    // TODO: implement initState
    if (number == null) {
      Fluttertoast.showToast(
          msg:
              "Please Provide your Mobile Number by Visiting the Profile Page");
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Easy Donate'),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                width: double.maxFinite,
                child: Card(
                    elevation: 3,
                    child: Container(
                      padding: new EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Type : ",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pink),
                              ),
                              Text(
                                  "${widget.snapshot.data.docs[widget.index]['type']}"),
                            ],
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Row(
                            children: [
                              Text(
                                "Donating : ",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pink),
                              ),
                              Text(
                                  "${widget.snapshot.data.docs[widget.index]['item']}"),
                            ],
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Row(
                            children: [
                              Text(
                                "Donor Name : ",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pink),
                              ),
                              Text(
                                  "${widget.snapshot.data.docs[widget.index]['donorName']}"),
                            ],
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Row(
                            children: [
                              Text(
                                "Donor Address : ",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pink),
                              ),
                              Text(
                                  "${widget.snapshot.data.docs[widget.index]['donorAddress']}"),
                            ],
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Row(
                            children: [
                              Text(
                                "City : ",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pink),
                              ),
                              Text(
                                  "${widget.snapshot.data.docs[widget.index]['city']}"),
                            ],
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Row(
                            children: [
                              Text(
                                "Description : ",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pink),
                              ),
                              Text(
                                  "${widget.snapshot.data.docs[widget.index]['desc']}"),
                            ],
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Row(
                            children: [
                              Text(
                                "Available till : ",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pink),
                              ),
                              Text(
                                  "${widget.snapshot.data.docs[widget.index]['expiry']}"),
                            ],
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Row(
                            children: [
                              Text(
                                "Posted on : ",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pink),
                              ),
                              Text(
                                  "${widget.snapshot.data.docs[widget.index]['time']}"),
                            ],
                          ),
                          SizedBox(
                            height: 7,
                          ),
                        ],
                      ),
                    )),
              ),
              number != null
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RaisedButton(
                          color: Colors.green,
                          onPressed: () async {
                            var url =
                                'tel:+91${widget.snapshot.data.docs[widget.index]['donorNumber']}';
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              Fluttertoast.showToast(msg: 'Try Again Later!!');
                            }
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.call,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Call',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        RaisedButton(
                          color: Colors.amber,
                          onPressed: () async {
                            var url =
                                'sms:+91${widget.snapshot.data.docs[widget.index]['donorNumber']}';
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              Fluttertoast.showToast(msg: 'Try Again Later!!');
                            }
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.message,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Message',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        RaisedButton(
                          color: Colors.green,
                          onPressed: () async {
                            var url =
                                'https://api.whatsapp.com/send/?phone=91${widget.snapshot.data.docs[widget.index]['donorNumber']}';
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              Fluttertoast.showToast(msg: 'Try Again Later!!');
                            }
                          },
                          child: Row(
                            children: [
                              Text(
                                'Whatsapp',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}

//
