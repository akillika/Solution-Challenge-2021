import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:solution_challenge_2021/postnew.dart';
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
                SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    width: double.maxFinite,
                    child: new Card(
                      elevation: 3,
                      child: new Container(
                        padding: new EdgeInsets.all(10.0),
                        child: new Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                new Text(
                                  ' Masks',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.pink),
                                ),
                                Text('4h ago'),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Icon(Icons.location_on_outlined),
                                Text(
                                  'Bengaluru',
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            new Text(
                                'I am ready to share masks to share it in our schools and colleges to prevent corona spread.'),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Expires in 4 days',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  '500 pcs',
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    width: double.maxFinite,
                    child: new Card(
                      elevation: 3,
                      child: new Container(
                        padding: new EdgeInsets.all(10.0),
                        child: new Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                new Text(
                                  ' Candles',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.pink),
                                ),
                                Text('4h ago'),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Icon(Icons.location_on_outlined),
                                Text(
                                  'Thanjavur',
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            new Text(
                                'I am ready to share masks to share it in our schools and colleges to prevent corona spread.'),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Need within 4 days',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  '100 pcs',
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
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
