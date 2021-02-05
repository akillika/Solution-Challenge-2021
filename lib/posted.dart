import 'package:flutter/material.dart';
import 'package:solution_challenge_2021/widgets.dart';

class Posted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posted'),
        centerTitle: true,
        actions: [AccountButton()],
      ),
      drawer: CustomDrawer(),
    );
  }
}
