import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_number/mobile_number.dart';
import 'package:solution_challenge_2021/signin.dart';
import 'package:solution_challenge_2021/widgets.dart';
import 'login.dart';

String _mobileNumber = '';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    MobileNumber.listenPhonePermission((isPermissionGranted) {
      if (isPermissionGranted) {
        initMobileNumberState();
      } else {
        initMobileNumberState();
      }
    });

    initMobileNumberState();
  }



  Future<void> initMobileNumberState() async {
    if (!await MobileNumber.hasPhonePermission) {
      await MobileNumber.requestPhonePermission;
      return;
    }
    String mobileNumber = '';
    try {
      mobileNumber = await MobileNumber.mobileNumber;
      _mobileNumber = mobileNumber;
    } on PlatformException catch (e) {
      debugPrint("Failed to get mobile number because of '${e.message}'");
    }
    if (!mounted) return;

    setState(() {
      _mobileNumber = mobileNumber.substring(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: CustomDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text('Profile'),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 45,
            ),
            CircleAvatar(
              radius: 70.0,
              backgroundImage: NetworkImage(imageUrl),
              backgroundColor: Colors.transparent,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              name,
              style: TextStyle(fontSize: 40),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              _mobileNumber,
              style: TextStyle(fontSize: 25),
            ),
            Text(
              email,
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    signOutGoogle().then((result) {
                      Navigator.pushAndRemoveUntil<dynamic>(
                        context,
                        MaterialPageRoute<dynamic>(
                          builder: (BuildContext context) => LoginPage(),
                        ),
                        (route) => false,
                      );
                    });
                  },
                  child: Material(
                    color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        color: Colors.red,
                        height: 30,
                        // width: 350,
                        child: Center(
                            child: Text(
                          'Logout',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        )),
                      ),
                    ),
                    elevation: 5,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
            ),
          ],
        )));
  }
}
