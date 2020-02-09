import 'package:easy_web_view/easy_web_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pcdashboard/utilities/configs.dart';
import 'package:flutter_pcdashboard/utilities/values.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GradientAppBar(
          title: Text(
            Values.HOME_PAGE.toUpperCase(),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
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
          src: Configs.homeUrl,
        ));
  }
}
