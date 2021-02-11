import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:solution_challenge_2021/posted.dart';
import 'package:solution_challenge_2021/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RequestDonation extends StatefulWidget {
  final String category;

  const RequestDonation({Key key, this.category}) : super(key: key);

  @override
  _RequestDonationState createState() => _RequestDonationState();
}

class _RequestDonationState extends State<RequestDonation> {
  final CollectionReference request =
      FirebaseFirestore.instance.collection('requests');
  DocumentReference result;
  String name, number, desc, location;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('${widget.category} Donation Request'),
        centerTitle: true,
        actions: [AccountButton()],
      ),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                onChanged: (_name) {
                  setState(() {
                    name = _name;
                  });
                  print(name);
                },
                decoration: InputDecoration(hintText: 'Requester Name'),
              ),
              TextField(
                onChanged: (_number) {
                  setState(() {
                    number = _number;
                  });
                  print(number);
                },
                keyboardType: TextInputType.phone,
                maxLength: 10,
                decoration: InputDecoration(
                    hintText: 'Requester Mobile Number(without Country Code)'),
              ),
              TextField(
                onChanged: (_location) {
                  location = _location;
                },
                maxLines: 5,
                decoration: InputDecoration(hintText: 'Delivery Address'),
              ),
              TextField(
                onChanged: (_desc) {
                  setState(() {
                    desc = _desc;
                  });
                  print(desc);
                },
                maxLines: 10,
                decoration: InputDecoration(hintText: 'Request Description'),
              ),
              NextButton(
                func: () async {
                  try {
                    assert(name != null && name.trim() != "");
                    assert(number != null && number.trim() != "");
                    assert(desc != null && desc.trim() != "");
                    assert(location != null && location.trim() != "");
                    result = await request.add({
                      "requesterName": '$name',
                      "requesterNumber": "+91" + "$number",
                      "requestDescription": "$desc",
                    });
                    if (result != null) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Posted()));
                    }
                  } on AssertionError {
                    Fluttertoast.showToast(
                        msg: 'None of the Fields can be Empty');
                  }
                },
              ),
              SizedBox(
                height: 30,
              ),
              //TODO:Mention the Details to be Mentioned in the Decription in this Material Widget
              Material(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 20,
                child: Container(
                    height: 300,
                    width: 400,
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text('Instructions :'),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
