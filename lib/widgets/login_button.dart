import 'package:flutter/material.dart';

class LoginRaisedButton extends StatelessWidget {
  String text;
  Function onClick;

  LoginRaisedButton(this.text, this.onClick);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.2,
      height: 50,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
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
        splashColor: Colors.black45,
        onPressed: onClick,
        child: Text(text,
            style: TextStyle(
                fontSize: 18,
                color: Colors.white,
            fontWeight: FontWeight.bold)),
      ),
    );
  }
}
