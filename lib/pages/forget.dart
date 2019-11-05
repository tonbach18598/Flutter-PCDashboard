import 'package:flutter/material.dart';import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_pcdashboard/widgets/forget_button.dart';
import 'package:flutter_pcdashboard/widgets/login_button.dart';
import 'package:flutter_pcdashboard/widgets/login_text_field.dart';

class ForgetPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ForgetPageState();
  }
}

class ForgetPageState extends State<ForgetPage> {
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
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2.5,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Colors.orange,
                              Colors.blue
                            ],
                            begin: FractionalOffset.topLeft,
                            end: FractionalOffset.bottomRight
                        ),
                        borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(100)),
                        color: Colors.black),
                  ),
                  Image.asset(
                    "logo.png",
                    width: 240,
                    height: 160,
                  ),
                  Positioned(
                      right: MediaQuery.of(context).size.width / 16,
                      bottom: MediaQuery.of(context).size.height / 16,
                      child: Text(
                        "Đăng nhập",
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 16,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30, left: 30),
                child: LoginTextField("Tài khoản", Icons.person),
              ),
              ForgetPasswordFlatButton("Trở về",onClick),
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 8,
              ),
              LoginRaisedButton("LẤY MẬT KHẨU"),
            ],
          ),
        ),
      ),
    );
  }
  onClick(){
    Navigator.of(context).pop();
  }
}
