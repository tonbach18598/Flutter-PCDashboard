import 'package:flutter/material.dart';

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

class MyWavyClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    var path = Path();

    path.lineTo(0, size.height-80);

    path.quadraticBezierTo(0.3 * size.width, size.height, 0.68*size.width, size.height -80);

    path.lineTo(0.68 * size.width, size.height-80);


    path.quadraticBezierTo(0.8416 * size.width, size.height -120 , size.width, size.height -80);

    path.lineTo(size.width, size.height-80);

    path.lineTo(size.width, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }

}