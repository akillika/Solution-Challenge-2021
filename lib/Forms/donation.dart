import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:solution_challenge_2021/Forms/review.dart';
import 'package:solution_challenge_2021/widgets.dart';

//TODO : Implement TextField Functions

class DonationDetails extends StatefulWidget {
  final String city;
  final String type;
  final String category;
  final String donorName;
  final String donorAddress;
  final String phno;

  const DonationDetails(
      {Key key,
      this.category,
      this.donorName,
      this.donorAddress,
      this.phno,
      this.type,
      this.city})
      : super(key: key);
  @override
  _DonationDetailsState createState() => _DonationDetailsState();
}

class _DonationDetailsState extends State<DonationDetails> {
  DateTime date = DateTime.now();
  int count;
  List<String> _items = [];
  List<String> _desc = [];
  List<String> _expiry = [];
  var nameCtlrs = <TextEditingController>[];
  var descCtlrs = <TextEditingController>[];
  var expiryCtlrs = <TextEditingController>[];
  var cards = <Card>[];
  Future<String> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null && picked != date)
      return "${picked.toLocal()}".split(' ')[0];
  }

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Expiry : " + expiryController.text,
                  style: TextStyle(fontSize: 16)),
              IconButton(
                  icon: Icon(
                    Icons.calendar_today_outlined,
                    color: Colors.blue,
                    size: 20,
                  ),
                  onPressed: () async {
                    String date = await _selectDate(context);
                    setState(() {
                      expiryController.text = date;
                    });
                  }),
            ],
          ),
          TextField(
            controller: expiryController,
            maxLines: 1,
          ),
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
        title: Text(widget.type == "Donate"
            ? "${widget.category} Donor Details"
            : "${widget.category} Request Details"),
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
                      builder: (context) => ReviewDetails(
                            type: widget.type,
                            category: widget.category,
                            city: widget.city,
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
