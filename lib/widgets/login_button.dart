import 'package:flutter/material.dart';

class LoginRaisedButton extends StatelessWidget {
  String text;

  LoginRaisedButton(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.2,
      height: MediaQuery.of(context).size.width / 8.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          gradient: new LinearGradient(
              begin: FractionalOffset.topLeft,
              end: FractionalOffset.bottomRight,
              colors: [
                Colors.orange,
                Colors.blue,
              ])),
      child: FlatButton(
        key: Key("login_button"),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0))),
        color: Colors.transparent,
        splashColor: Colors.black45,
        onPressed: () {},
        child: Text(text,
            style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.normal)),
      ),
    );
  }
}
