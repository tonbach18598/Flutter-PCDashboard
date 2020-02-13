import 'package:flutter/material.dart';

class SigninButton extends StatelessWidget {
  String title;
  VoidCallback onPress;

  SigninButton({@required this.title, @required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.9,
      child: Container(
        width: MediaQuery.of(context).size.width / 1.2,
        height: 50,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[400],
                  blurRadius: 5,
                  spreadRadius: 2,
                  offset: Offset(2, 2)),
            ],
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            gradient: new LinearGradient(
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight,
                colors: [
                  Colors.deepOrange,
                  Colors.deepOrangeAccent,
                  Colors.orange,
                  Colors.orangeAccent,
                  Colors.lightBlueAccent,
                  Colors.lightBlue,
                  Colors.blue,
                  Colors.blueAccent
                ])),
        child: FlatButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0))),
          color: Colors.transparent,
          splashColor: Colors.grey,
          onPressed: onPress,
          child: Text(title,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
              fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
