import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:solution_challenge_2021/Pages/donationsTab.dart';
import 'package:solution_challenge_2021/Pages/requestsTab.dart';
import 'package:solution_challenge_2021/postnew.dart';
import 'package:solution_challenge_2021/signin.dart';
import 'package:solution_challenge_2021/splash.dart';
import 'package:solution_challenge_2021/widgets.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

DocumentSnapshot check;
var number;
getNumber() async {
  check = await FirebaseFirestore.instance.collection('Users').doc(uid).get();
  if (check.data() != null) number = check.data()['Mobile'];
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Solution Challenge',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Splash(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    getNumber();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          drawer: CustomDrawer(),
          appBar: AppBar(
            title: Text('Easy Donate'),
            centerTitle: true,
            backgroundColor: Colors.pink,
            actions: [AccountButton()],
            bottom: TabBar(
              tabs: [
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("Donations"),
                  ),
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("Requests"),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              SingleChildScrollView(child: DonationsTab()),
              SingleChildScrollView(child: RequestsTab()),
            ],
          ),
          floatingActionButton: new FloatingActionButton(
            backgroundColor: Colors.pink,
            onPressed: () async {
              if (number != null) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Postnew()));
              } else {
                Fluttertoast.showToast(
                    msg:
                        "Please Provide your Mobile Number by Visiting the Profile Page");
              }
            },
            tooltip: 'Post',
            child: new Icon(Icons.add),
          ) // This trailing
          ),
    );
  }
}
