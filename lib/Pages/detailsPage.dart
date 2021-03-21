import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:solution_challenge_2021/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsPage extends StatefulWidget {
  final AsyncSnapshot snapshot;
  final int index;

  const DetailsPage({Key key, this.snapshot, this.index}) : super(key: key);
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Easy Donate'),
        centerTitle: true,
        backgroundColor: Colors.pink,
        actions: [AccountButton()],
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              Text("Type : " + widget.snapshot.data.docs[widget.index]['type']),
              Text("Name : " +
                  widget.snapshot.data.docs[widget.index]['donorName']),
              Text("Address : " +
                  widget.snapshot.data.docs[widget.index]['donorAddress']),
              Text("City : " + widget.snapshot.data.docs[widget.index]['city']),
              Text("Number : " +
                  widget.snapshot.data.docs[widget.index]['donorNumber']),
              Text("Item : " + widget.snapshot.data.docs[widget.index]['item']),
              Text("Description : " +
                  widget.snapshot.data.docs[widget.index]['desc']),
              Text("Available till : " +
                  widget.snapshot.data.docs[widget.index]['expiry']),
              Text("Posted on : " +
                  widget.snapshot.data.docs[widget.index]['time']),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RaisedButton(
                    onPressed: () async {
                      var url =
                          'tel:+91${widget.snapshot.data.docs[widget.index]['donorNumber']}';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        Fluttertoast.showToast(msg: 'Try Again Later!!');
                      }
                    },
                    child: Text('Call'),
                  ),
                  RaisedButton(
                    onPressed: () async {
                      var url =
                          'sms:+91${widget.snapshot.data.docs[widget.index]['donorNumber']}';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        Fluttertoast.showToast(msg: 'Try Again Later!!');
                      }
                    },
                    child: Text('Message'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
