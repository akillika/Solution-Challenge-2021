import 'package:flutter/material.dart';
import 'package:solution_challenge_2021/postnew.dart';
import 'package:solution_challenge_2021/profile.dart';
import 'package:solution_challenge_2021/splash.dart';
import 'package:solution_challenge_2021/widgets.dart';
import 'package:firebase_core/firebase_core.dart';

import 'login.dart';

void main() async {
  runApp(MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      home: LoginPage(),
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
    return Scaffold(
        drawer: CustomDrawer(),
        appBar: AppBar(
          title: Text("Solution Challenge"),
          // leading: Icon(
          //   Icons.menu, // add custom icons also
          // ),
          actions: <Widget>[AccountButton()],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  greetings(),
                  style: TextStyle(
                    fontFamily: "Circular Air",
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff101010),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "Recent posts:",
                  style: TextStyle(
                      fontFamily: "Circular Air",
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.pink),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                child: ListTile(
                  leading: FlutterLogo(size: 72.0),
                  title: Text('Three-line ListTile'),
                  subtitle: Text(
                      'A sufficiently long subtitle warrants three lines.'),
                  trailing: Icon(Icons.more_vert),
                  isThreeLine: true,
                ),
              ),
              Card(
                child: ListTile(
                  leading: FlutterLogo(size: 72.0),
                  title: Text('Three-line ListTile'),
                  subtitle: Text(
                      'A sufficiently long subtitle warrants three lines.'),
                  trailing: Icon(Icons.more_vert),
                  isThreeLine: true,
                ),
              ),
              Card(
                child: ListTile(
                  leading: FlutterLogo(size: 72.0),
                  title: Text('Three-line ListTile'),
                  subtitle: Text(
                      'A sufficiently long subtitle warrants three lines.'),
                  trailing: Icon(Icons.more_vert),
                  isThreeLine: true,
                ),
              ),
              Card(
                child: ListTile(
                  leading: FlutterLogo(size: 72.0),
                  title: Text('Three-line ListTile'),
                  subtitle: Text(
                      'A sufficiently long subtitle warrants three lines.'),
                  trailing: Icon(Icons.more_vert),
                  isThreeLine: true,
                ),
              ),
              Card(
                child: ListTile(
                  leading: FlutterLogo(size: 72.0),
                  title: Text('Three-line ListTile'),
                  subtitle: Text(
                      'A sufficiently long subtitle warrants three lines.'),
                  trailing: Icon(Icons.more_vert),
                  isThreeLine: true,
                ),
              ),
              Card(
                child: ListTile(
                  leading: FlutterLogo(size: 72.0),
                  title: Text('Three-line ListTile'),
                  subtitle: Text(
                      'A sufficiently long subtitle warrants three lines.'),
                  trailing: Icon(Icons.more_vert),
                  isThreeLine: true,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: new FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => Postnew()));
          },
          tooltip: 'Post',
          child: new Icon(Icons.add),
        ) // This trailing
        );
  }
}

String greetings() {
  var now;
  now = DateTime.now().hour;
  if (now < 12) {
    return 'Good morning, ';
  } else if (now < 17) {
    return 'Good afternoon,';
  } else {
    return 'Good evening,';
  }
}
