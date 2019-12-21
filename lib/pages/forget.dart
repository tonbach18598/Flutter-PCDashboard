
import 'package:flutter/material.dart';import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_pcdashboard/router.dart';
import 'package:flutter_pcdashboard/widgets/logo.dart';
import 'package:flutter_pcdashboard/widgets/forget_button.dart';
import 'package:flutter_pcdashboard/widgets/login_button.dart';
import 'package:flutter_pcdashboard/widgets/login_text_field.dart';

class ForgetPage extends StatefulWidget {
  @override
  @override
  _ForgetPageState createState() => _ForgetPageState();
}

class _ForgetPageState extends State<ForgetPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: Color(0xf5f5f5),
          child: Column(
            children: <Widget>[
              LogoWidget("Quên mật khẩu"),
              SizedBox(
                height: MediaQuery.of(context).size.height / 16,
              ),
              Padding(
                padding: const EdgeInsets.only(top:75,bottom:10,right: 30, left: 30),
                child: LoginTextField("Tài khoản", Icons.person),
              ),
              ForgetPasswordFlatButton("Trở về",onBackClick),
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 8,
              ),
              LoginRaisedButton("LẤY MẬT KHẨU",null),
            ],
          ),
        ),
      ),
    );

  }
  void onBackClick(){
    Navigator.of(context).pop();

  }
}
