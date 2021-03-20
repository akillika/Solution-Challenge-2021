import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:solution_challenge_2021/Pages/donationsTab.dart';
import 'package:solution_challenge_2021/Pages/requestsTab.dart';
import 'package:solution_challenge_2021/postnew.dart';
import 'package:solution_challenge_2021/signin.dart';
import 'package:solution_challenge_2021/widgets.dart';
import 'package:firebase_core/firebase_core.dart';
import 'login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  signed = await googleSignIn.isSignedIn();
  runApp(MyApp());
}

bool signed;

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
      home: signed ? MyHomePage() : LoginPage(),
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
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
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
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Postnew()));
              },
              tooltip: 'Post',
              child: new Icon(Icons.add),
            ) // This trailing
            ),
      ),
    );
  }
}
