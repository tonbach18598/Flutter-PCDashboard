import 'package:flutter/material.dart';

class ForgetPasswordFlatButton extends StatelessWidget {
  String text;
  Function onClick;

  ForgetPasswordFlatButton(this.text, this.onClick);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 30),
          child: FlatButton(
            child: Text(
              text,
              style: TextStyle(color: Colors.black54,fontSize: 16),
            ),
            onPressed: onClick,
          ),
        ),
      ],
    );
  }
}
