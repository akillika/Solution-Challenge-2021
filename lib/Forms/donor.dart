import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:solution_challenge_2021/Forms/donation.dart';
import 'package:solution_challenge_2021/widgets.dart';

class DonorDetails extends StatefulWidget {
  final String category;

  const DonorDetails({Key key, this.category}) : super(key: key);

  @override
  _DonorDetailsState createState() => _DonorDetailsState();
}

class _DonorDetailsState extends State<DonorDetails> {
  String name, address, mobile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.category} Donor Details"),
        centerTitle: true,
        actions: [AccountButton()],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextField(
                onChanged: (_name) {
                  name = _name;
                },
                decoration: InputDecoration(hintText: 'Name'),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                onChanged: (_address) {
                  address = _address;
                },
                decoration: InputDecoration(
                  hintText: 'Address',
                ),
                maxLines: 5,
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                onChanged: (_mobile) {
                  mobile = _mobile;
                },
                maxLength: 10,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    hintText:
                        'Mobile Number (Ignore to save number automatically)'),
              ),
              SizedBox(
                height: 20,
              ),
              NextButton(func: () {
                try {
                  assert(name != null && name.trim() != "");
                  assert(address != null && address.trim() != "");
                  assert(mobile != null && mobile.trim() != "");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DonationDetails(
                                category: widget.category,
                                donorAddress: address,
                                donorName: name,
                                phno: mobile,
                              )));
                } on AssertionError {
                  Fluttertoast.showToast(
                      msg: 'None of the Fields can be Empty');
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
