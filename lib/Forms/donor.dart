import 'package:flutter/material.dart';
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
                decoration: InputDecoration(hintText: 'Mobile Number'),
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DonationDetails(
                                category: widget.category,
                                donorAddress: address,
                                donorName: name,
                                phno: mobile,
                              )));
                },
                shape: StadiumBorder(),
                color: Colors.pink,
                child: Text(
                  'Next',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
