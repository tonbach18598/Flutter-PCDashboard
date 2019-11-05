import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_pcdashboard/navigator.dart';
import 'package:flutter_pcdashboard/widgets/logo.dart';
import 'package:flutter_pcdashboard/widgets/forget_button.dart';
import 'package:flutter_pcdashboard/widgets/login_button.dart';
import 'package:flutter_pcdashboard/widgets/login_text_field.dart';

class LoginPage extends StatefulWidget {
  @override
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  PageNavigator pageNavigator = PageNavigator.getInstance();

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
            LogoWidget("Đăng nhập"),
            SizedBox(
              height: MediaQuery.of(context).size.height / 16,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30, left: 30),
              child: LoginTextField("Tài khoản", Icons.person),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 20, bottom: 10, left: 30, right: 30),
              child: LoginTextField("Mật khẩu", Icons.lock),
            ),
            ForgetPasswordFlatButton("Quên mật khẩu?", onForgetClick),
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 8,
            ),
            LoginRaisedButton("ĐĂNG NHẬP",onLoginClick),
          ],
        ),
      )),
    );
  }

  void onForgetClick() {
    pageNavigator.navigate(context, PageNavigator.FORGET_PAGE);
  }

  void onLoginClick(){
    pageNavigator.navigate(context, PageNavigator.DASHBOARD_PAGE);
  }

}
