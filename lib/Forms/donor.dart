import 'package:flutter/material.dart';
import 'package:solution_challenge_2021/widgets.dart';

class DonorDetails extends StatefulWidget {
  @override
  _DonorDetailsState createState() => _DonorDetailsState();
}

class _DonorDetailsState extends State<DonorDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Donor Details"),
        centerTitle: true,
        actions: [AccountButton()],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(),
    );
  }
}
