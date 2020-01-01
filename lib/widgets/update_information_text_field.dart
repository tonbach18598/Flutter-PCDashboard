import 'package:flutter/material.dart';

class UpdateInformationTextField extends StatelessWidget {
  bool readOnly;
  bool obscureText;
  Icon prefixIcon;
  Color borderColor;
  String hintText;
  TextEditingController controller;

  UpdateInformationTextField({this.readOnly=false, this.obscureText=false,@required this.prefixIcon,@required this.borderColor,@required this.hintText,@required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: borderColor),
          borderRadius: BorderRadius.circular(20),
          color: Colors.white),
      child: TextField(
        obscureText: obscureText,
        cursorColor: Colors.lightBlue,
        textAlignVertical: TextAlignVertical.center,
        readOnly: readOnly,
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: prefixIcon,
          hintText: hintText
        ),
      ),
    );
  }
}
