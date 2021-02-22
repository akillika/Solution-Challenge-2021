import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:solution_challenge_2021/posted.dart';
import 'package:solution_challenge_2021/widgets.dart';

class ReviewDetails extends StatefulWidget {
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
      this.expiry})
      : super(key: key);
  @override
  _ReviewDetailsState createState() => _ReviewDetailsState();
}

class _ReviewDetailsState extends State<ReviewDetails> {
  final CollectionReference donation =
      FirebaseFirestore.instance.collection('donation');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Review Details'),
        centerTitle: true,
        actions: [AccountButton()],
      ),
      drawer: CustomDrawer(),
      body: Center(
        child: Column(
          children: [
            Text('Donating : ${widget.category}'),
            Text('Donor Name : ${widget.donorName}'),
            Text(
              'Donor Address : ${widget.donorAddress}',
              softWrap: true,
            ),
            Text('Donor Contact Number : ${widget.phno}'),
            Text('Items :'),
            ListView.builder(
              shrinkWrap: true,
              itemCount: widget.items.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Text('Item $index : ${widget.items[index]}'),
                    Text('Description $index : ${widget.desc[index]}'),
                    Text('Expiry $index : ${widget.expiry[index]}')
                  ],
                );
              },
            ),
            RaisedButton(
              shape: StadiumBorder(),
              color: Colors.green,
              child: Text(
                'Post',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                try {
                  for (int i = 0; i < widget.items.length; i++) {
                    donation.add({
                      "type": widget.category,
                      "donorName": widget.donorName,
                      "donorAddress": widget.donorAddress,
                      "donorNumber": widget.phno,
                      "item": widget.items[i],
                      "desc": widget.desc[i],
                      "expiry": widget.expiry[i],
                      "time": DateTime.now().toLocal(),
                    });
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
    );
  }
}
