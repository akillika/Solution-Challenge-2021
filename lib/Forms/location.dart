import 'package:flutter/material.dart';
import 'package:solution_challenge_2021/Forms/review.dart';
import 'package:solution_challenge_2021/widgets.dart';

class LocationDetails extends StatefulWidget {
  final String category;
  final String donorName;
  final String donorAddress;
  final String phno;
  final List<String> items;
  final List<String> desc;
  final List<String> expiry;

  const LocationDetails(
      {Key key,
      this.category,
      this.donorName,
      this.donorAddress,
      this.phno,
      this.items,
      this.desc,
      this.expiry})
      : super(key: key);
  @override
  _LocationDetailsState createState() => _LocationDetailsState();
}

class _LocationDetailsState extends State<LocationDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [AccountButton()],
        title: Text('Location Details'),
        centerTitle: true,
      ),
      drawer: CustomDrawer(),
      body: Column(
        children: [
          RaisedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ReviewDetails(
                            category: widget.category,
                            donorAddress: widget.donorAddress,
                            donorName: widget.donorName,
                            phno: widget.phno,
                            desc: widget.desc,
                            items: widget.items,
                            expiry: widget.expiry,
                          )));
            },
            color: Colors.pink,
            child: Text(
              'Next',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
