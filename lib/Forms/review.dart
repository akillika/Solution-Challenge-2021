import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:solution_challenge_2021/posted.dart';
import 'package:solution_challenge_2021/widgets.dart';

class ReviewDetails extends StatefulWidget {
  final String city;
  final String type;
  final String category;
  final String donorName;
  final String donorAddress;
  final String phno;
  final List<String> items;
  final List<String> desc;
  final List<String> expiry;

  const ReviewDetails(
      {Key key,
      this.category,
      this.donorName,
      this.donorAddress,
      this.phno,
      this.items,
      this.desc,
      this.expiry,
      this.type,
      this.city})
      : super(key: key);
  @override
  _ReviewDetailsState createState() => _ReviewDetailsState();
}

class _ReviewDetailsState extends State<ReviewDetails> {
  final CollectionReference donation =
      FirebaseFirestore.instance.collection('donation');
  final CollectionReference requests =
      FirebaseFirestore.instance.collection('requests');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text('Review Details'),
        centerTitle: true,
        actions: [AccountButton()],
      ),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
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
                              Text("${widget.type}"),
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
                              Text("${widget.city}"),
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
                              Text("${widget.category}"),
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
                              Text("${widget.donorName}"),
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
                              Text("${widget.donorAddress}"),
                            ],
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          // Text(
                          //   'Donor Address : ${widget.donorAddress}',
                          //   softWrap: true,
                          // ),
                          Row(
                            children: [
                              Text(
                                "Donor Contact Number : ",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pink),
                              ),
                              Text("${widget.phno}"),
                            ],
                          ),
                          SizedBox(
                            height: 7,
                          ),
                        ],
                      ),
                    )),
              ),
              SizedBox(height: 15),
              Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  width: double.maxFinite,
                  child: Card(
                      elevation: 3,
                      child: Flexible(
                        child: Container(
                            padding: new EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: widget.items.length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Product : ',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.pink),
                                            ),
                                            Text('${widget.items[index]}'),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 7,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Description  : ',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.pink),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          '${widget.desc[index]}',
                                          softWrap: true,
                                        ),
                                        SizedBox(
                                          height: 7,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Expiry  : ',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.pink),
                                            ),
                                            Text('${widget.expiry[index]}'),
                                          ],
                                        ),
                                        Divider(),
                                        SizedBox(
                                          height: 15,
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ],
                            )),
                      ))),
              SizedBox(
                height: 15,
              ),
              RaisedButton(
                shape: StadiumBorder(),
                color: Colors.green,
                child: Text(
                  'Confirm and Post',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  try {
                    if (widget.type == "Donate") {
                      for (int i = 0; i < widget.items.length; i++) {
                        donation.add({
                          "type": widget.category,
                          "city": widget.city,
                          "donorName": widget.donorName,
                          "donorAddress": widget.donorAddress,
                          "donorNumber": widget.phno,
                          "item": widget.items[i],
                          "desc": widget.desc[i],
                          "expiry": widget.expiry[i],
                          "time": "${DateTime.now().toLocal()}".split(' ')[0],
                        });
                      }
                    }
                    if (widget.type == "Request Donation") {
                      for (int i = 0; i < widget.items.length; i++) {
                        requests.add({
                          "type": widget.category,
                          "city": widget.city,
                          "donorName": widget.donorName,
                          "donorAddress": widget.donorAddress,
                          "donorNumber": widget.phno,
                          "item": widget.items[i],
                          "desc": widget.desc[i],
                          "expiry": widget.expiry[i],
                          "time": "${DateTime.now().toLocal()}".split(' ')[0],
                        });
                      }
                    }
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Posted()));
                  } catch (error) {
                    Fluttertoast.showToast(msg: error);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
