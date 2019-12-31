import 'package:easy_web_view/easy_web_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pcdashboard/utilities/config.dart';
import 'package:flutter_pcdashboard/utilities/value.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: Text(Value.HOME_PAGE.toUpperCase(),style: TextStyle(fontWeight: FontWeight.bold),),
        elevation: 0,
        automaticallyImplyLeading: true,
        gradient: LinearGradient(
            colors: [
              Colors.deepOrange,
              Colors.deepOrangeAccent,
              Colors.orange,
              Colors.orangeAccent,
            ],
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter),
      ),
      body: EasyWebView(
        src: Config.homeUrl,
      )
    );
  }
}
