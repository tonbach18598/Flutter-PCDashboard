import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_pcdashboard/config.dart';
import 'package:flutter_pcdashboard/router.dart';
import 'package:flutter_pcdashboard/widgets/logo.dart';
import 'package:flutter_pcdashboard/widgets/forget_button.dart';
import 'package:flutter_pcdashboard/widgets/login_button.dart';
import 'package:flutter_pcdashboard/widgets/login_text_field.dart';

class SigninPage extends StatefulWidget {
  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: Color(0xf5f5f5),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                LogoWidget("Đăng nhập"),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 16,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30, left: 30),
                  child: LoginTextField(Config.ACCOUNT, Icons.person),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20, bottom: 10, left: 30, right: 30),
                  child: LoginTextField(Config.PASSWORD, Icons.lock),
                ),
                ForgetPasswordFlatButton("Quên mật khẩu?", onForgetClick),
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 8,
                ),
                LoginRaisedButton("ĐĂNG NHẬP", onLoginClick),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onForgetClick() {
    Navigator.of(context).pushNamed(Router.forgetRoute);
  }

  void onLoginClick() {
    Navigator.of(context).pushReplacementNamed(Router.dashboardRoute);
  }
}
