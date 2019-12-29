import 'package:flutter/material.dart';
import 'package:flutter_pcdashboard/utility/value.dart';
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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
          ),
          IconButton(
            icon: Icon(Icons.arrow_forward_ios,color: Colors.white,),
          )
        ],
      ),
      body: Container(),
    );
  }
}
