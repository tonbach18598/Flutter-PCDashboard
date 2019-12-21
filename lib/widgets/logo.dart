import 'package:flutter/material.dart';
import 'package:flutter_pcdashboard/pages/department.dart';

class Logo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        ClipPath(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2.5,
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
                color: Colors.black),
          ),
          clipper: MyWavyClipper(),
        ),
        Image.asset(
          "logo.png",
          width: MediaQuery.of(context).size.width/2,
          height: MediaQuery.of(context).size.height/4,
        ),
      ],
    );
  }
}

