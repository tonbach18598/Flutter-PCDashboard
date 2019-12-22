import 'package:flutter/material.dart';

class SigninTextField extends StatelessWidget {
  TextEditingController textEditingController;
  String labelText;
  bool obscureText;
  IconData prefixIcon;
  IconData suffixIcon;
  String errorText;

  SigninTextField(
      {this.textEditingController,
      this.labelText,
      this.obscureText,
      this.prefixIcon,
      this.suffixIcon,
      this.errorText});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                blurRadius: 10,
                spreadRadius: 1,
                offset: Offset(5, 5)),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Theme(
        data: ThemeData(
          primaryColor: Colors.orange,
        ),
        child: TextField(
            controller: textEditingController,
            cursorColor: Colors.orange,
            obscureText: obscureText,
            decoration: InputDecoration(
              errorText: errorText,
              enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(const Radius.circular(30.0)),
                borderSide: BorderSide.none,
              ),
              labelText: labelText,
              labelStyle: TextStyle(fontSize: 18),
              prefixIcon: Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Icon(prefixIcon),
              ),
              suffixIcon: Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Icon(suffixIcon),
              ),
            )),
      ),
    );
  }
}