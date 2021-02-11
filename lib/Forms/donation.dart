import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:solution_challenge_2021/Forms/location.dart';
import 'package:solution_challenge_2021/widgets.dart';

//TODO : Implement TextField Functions

class DonationDetails extends StatefulWidget {
  final String category;
  final String donorName;
  final String donorAddress;
  final String phno;

  const DonationDetails(
      {Key key, this.category, this.donorName, this.donorAddress, this.phno})
      : super(key: key);
  @override
  _DonationDetailsState createState() => _DonationDetailsState();
}

class _DonationDetailsState extends State<DonationDetails> {
  int count;
  List<String> _items = [];
  List<String> _desc = [];
  List<String> _expiry = [];
  var nameCtlrs = <TextEditingController>[];
  var descCtlrs = <TextEditingController>[];
  var expiryCtlrs = <TextEditingController>[];
  var cards = <Card>[];
  Card createCard() {
    final nameController = TextEditingController();
    final descController = TextEditingController();
    final expiryController = TextEditingController();
    nameCtlrs.add(nameController);
    descCtlrs.add(descController);
    expiryCtlrs.add(expiryController);
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextField(
            controller: nameController,
            decoration: InputDecoration(hintText: 'Item'),
            maxLines: 1,
          ),
          TextField(
            controller: descController,
            decoration: InputDecoration(
              hintText: 'Description',
            ),
            maxLines: 5,
          ),
          TextField(
            controller: expiryController,
            decoration: InputDecoration(
              hintText: 'Expiry(if any)',
            ),
            maxLines: 1,
          ),
          // const Divider(
          //   color: Colors.pink,
          //   height: 50,

          //   thickness: 5,
          //   // indent: 20,
          //   // endIndent: 0,
          // ),
        ],
      ),
    );
  }

  @override
  void initState() {
    cards.add(createCard());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.category} Donation Details'),
        actions: [AccountButton()],
        centerTitle: true,
      ),
      drawer: CustomDrawer(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cards.length,
              itemBuilder: (BuildContext context, int index) {
                return cards[index];
              },
            ),
          ),
          RaisedButton(
            color: Colors.pink,
            onPressed: () {
              setState(() {
                cards.add(createCard());
              });
            },
            child: Text(
              '+  Add another',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.save),
          onPressed: () {
            try {
              for (int i = 0; i < cards.length; i++) {
                assert(nameCtlrs[i].text != null &&
                    nameCtlrs[i].text.trim() != "");
                assert(descCtlrs[i].text != null &&
                    descCtlrs[i].text.trim() != "");
                assert(expiryCtlrs[i].text != null &&
                    expiryCtlrs[i].text.trim() != "");
                _items.add(nameCtlrs[i].text);
                _desc.add(descCtlrs[i].text);
                _expiry.add(expiryCtlrs[i].text);
              }
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LocationDetails(
                            category: widget.category,
                            donorAddress: widget.donorAddress,
                            donorName: widget.donorName,
                            phno: widget.phno,
                            desc: _desc,
                            items: _items,
                            expiry: _expiry,
                          )));
            } on AssertionError {
              Fluttertoast.showToast(msg: 'None of the Fields can be Empty');
            }
          }),
    );
  }
}
