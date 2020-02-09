import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';
import 'package:flutter_pcdashboard/utilities/routes.dart';
import 'package:flutter_pcdashboard/utilities/preferences.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with AfterLayoutMixin<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Colors.deepOrange,
                Colors.deepOrangeAccent,
                Colors.orange,
                Colors.orangeAccent,
                Colors.white,
                Colors.lightBlueAccent,
                Colors.lightBlue,
                Colors.blue,
                Colors.blueAccent
              ],
              begin: FractionalOffset.topLeft,
              end: FractionalOffset.bottomRight),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'logo.png',
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.width * 0.6,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 10,
            ),
            SpinKitRing(
              color: Colors.white,
              size: 50.0,
            )
          ],
        ),
      ),
    );
  }

  @override
  Future afterFirstLayout(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 1));
    if (await Preferences.loadToken() == null)
      Navigator.of(context).pushReplacementNamed(Routes.signinRoute);
    else
      Navigator.of(context).pushReplacementNamed(Routes.dashboardRoute);
  }
}
