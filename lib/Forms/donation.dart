import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  @override
  void initState() {
    count = 1;
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
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                ListView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: count,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          TextField(
                            onChanged: (_item) {},
                            decoration: InputDecoration(hintText: 'Item'),
                            maxLines: 1,
                          ),
                          TextField(
                            onChanged: (_des) {},
                            decoration: InputDecoration(
                              hintText: 'Description',
                            ),
                            maxLines: 5,
                          ),
                          TextField(
                            onChanged: (_expire) {},
                            decoration: InputDecoration(
                              hintText: 'Expiry(if any)',
                            ),
                            maxLines: 1,
                          ),
                          const Divider(
                            color: Colors.pink,
                            height: 50,
                            thickness: 5,
                            // indent: 20,
                            // endIndent: 0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RaisedButton(
                                color: Colors.pink,
                                onPressed: () {
                                  setState(() {
                                    count = count + 1;
                                  });
                                },
                                child: Text(
                                  '+  Add another',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              NextButton(
                                func: () => Navigator.push(
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
                                            ))),
                              ),
                            ],
                          )
                        ],
                      );
                    }),
              ],
            ),
          ),
        ));
  }
}
