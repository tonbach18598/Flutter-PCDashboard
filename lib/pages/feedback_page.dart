import 'package:flutter/material.dart';
import 'package:flutter_pcdashboard/utilities/values.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: Text(Values.FEEDBACK.toUpperCase(),style: TextStyle(fontWeight: FontWeight.bold),),
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
      body: Container(),
    );
  }
}
