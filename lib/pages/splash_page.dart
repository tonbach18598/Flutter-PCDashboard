import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';
import 'package:flutter_pcdashboard/pages/signin_page.dart';
import 'package:flutter_pcdashboard/utility/router.dart';
import 'package:flutter_pcdashboard/utility/preferences.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with AfterLayoutMixin<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.deepOrange,
            Colors.deepOrangeAccent,
            Colors.orange,
            Colors.orangeAccent,
            Colors.white,
            Colors.lightBlueAccent,
            Colors.lightBlue,
            Colors.blue,
            Colors.blueAccent
          ], begin: FractionalOffset.topLeft, end: FractionalOffset.bottomRight),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset("logo.png",width: 360,height: 240,),
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
  Future afterFirstLayout(BuildContext context) async{
    if (await PreferencesUtil.loadToken() == null)
      Navigator.of(context).pushReplacementNamed(Router.signinRoute);
    else
      Navigator.of(context).pushReplacementNamed(Router.dashboardRoute);
  }
}
