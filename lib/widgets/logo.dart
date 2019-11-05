import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  String title;

  LogoWidget(this.title);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 2.5,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10,
                    spreadRadius: 1,
                    offset: Offset(5, 5)),
              ],
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
              borderRadius:
              BorderRadius.only(bottomLeft: Radius.circular(100)),
              color: Colors.black),
        ),
        Image.asset(
          "logo.png",
          width: 240,
          height: 160,
        ),
        Positioned(
            right: MediaQuery.of(context).size.width / 16,
            bottom: MediaQuery.of(context).size.height / 16,
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ))
      ],
    );
  }
}
