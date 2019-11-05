import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  String labelText;
  IconData prefixIconData;

  LoginTextField(this.labelText,this.prefixIconData);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(
          color: Colors.grey,
          blurRadius: 10,
          spreadRadius: 1,
          offset: Offset(
            5,5
          )
        ),],
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(30))
      ),
      child: Theme(
        data: ThemeData(
          primaryColor: Colors.orange,
        ),
        child: TextField(
          cursorColor: Colors.blue,
          obscureText: labelText=="Mật khẩu"?true:false,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(const Radius.circular(30.0)),
              borderSide: BorderSide.none,
            ),
            labelText: labelText,
            labelStyle: TextStyle(fontSize: 18),
            prefixIcon: Padding(
              padding: EdgeInsets.only(left: 20,right: 20),
              child: Icon(prefixIconData),
            ),
            suffixIcon: Padding(
              padding: EdgeInsets.only(left: 20,right: 20),
              child: labelText=="Mật khẩu"? Icon(Icons.visibility,
              ):null,
            )
          ),
        ),
      ),
    );
  }
}
