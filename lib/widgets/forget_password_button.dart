import 'package:flutter/material.dart';

class ForgetPasswordButton extends StatelessWidget {
  String title;
  VoidCallback onPress;

  ForgetPasswordButton({@required this.title, @required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 30),
          child: FlatButton(
            child: Text(
              title,
              style: TextStyle(color: Colors.grey,fontSize: 16),
            ),
            onPressed: onPress,
          ),
        ),
      ],
    );
  }
}
