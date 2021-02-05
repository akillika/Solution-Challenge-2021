import 'package:flutter/material.dart';
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
            itemlist(context, widget.items, widget.desc, widget.expiry),
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
              child: Text(
                'Next',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.pink,
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Posted()));
              },
            )
          ],
        ),
      ),
    );
  }
}

Widget itemlist(BuildContext context, List<String> items, List<String> desc,
    List<String> exp) {
  return ListView.builder(
    shrinkWrap: true,
    itemCount: items.length,
    itemBuilder: (context, index) {
      return Column(
        children: [
          Text('Item $index : ${items[index]}'),
          Text('Description $index : ${desc[index]}'),
          Text('Expiry $index : ${exp[index]}')
        ],
      );
    },
  );
}
