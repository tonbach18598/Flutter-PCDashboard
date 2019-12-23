import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pcdashboard/blocs/signin/signin_bloc.dart';
import 'package:flutter_pcdashboard/blocs/signin/signin_event.dart';
import 'package:flutter_pcdashboard/blocs/signin/signin_state.dart';
import 'package:flutter_pcdashboard/config.dart';
import 'package:flutter_pcdashboard/router.dart';
import 'package:flutter_pcdashboard/widgets/logo.dart';
import 'package:flutter_pcdashboard/widgets/forget_button.dart';
import 'package:flutter_pcdashboard/widgets/signin_button.dart';
import 'package:flutter_pcdashboard/widgets/signin_text_field.dart';
import 'package:oktoast/oktoast.dart';

class SigninPage extends StatefulWidget {
  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  TextEditingController usernameController;
  TextEditingController passwordController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) => SigninBloc(),
      child: BlocListener<SigninBloc, SigninState>(
        listener: (context, state) {
          if (state is SuccessSigninState) {
            showToast(
              "Đăng nhập thành công",
              duration: Duration(seconds: 1),
              position: ToastPosition.center,
              backgroundColor: Colors.green.withOpacity(0.8),
              radius: 30.0,
              textPadding: EdgeInsets.all(15),
              textStyle: TextStyle(color:Colors.white, fontSize: 16),
            );
              Navigator.of(context).pushReplacementNamed(Router.dashboardRoute);
          } else if(state is FailureSigninState){
            showToast(
              "Đăng nhập thất bại",
              duration: Duration(seconds: 1),
              position: ToastPosition.center,
              backgroundColor: Colors.red.withOpacity(0.8),
              radius: 30.0,
              textPadding: EdgeInsets.all(15),
              textStyle: TextStyle(color:Colors.white, fontSize: 16),
            );
          } else if(state is WarningSigninState){
            showToast(
              "Tài khoản hoặc mật khẩu không được trống",
              duration: Duration(seconds: 1),
              position: ToastPosition.center,
              backgroundColor: Colors.amber.withOpacity(0.8),
              radius: 30.0,
              textPadding: EdgeInsets.all(15),
              textStyle: TextStyle(color:Colors.white, fontSize: 16),
            );
          }
          else if (state is ClickForgetPasswordState) {
            Navigator.of(context).pushNamed(Router.forgetRoute);
          }
        },
        child: BlocBuilder<SigninBloc, SigninState>(
            builder: (context, state) => Scaffold(
                  body: SingleChildScrollView(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      color: Color(0xf5f5f5),
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            Logo(),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 16,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 30, left: 30),
                              child:SigninTextField(
                                        textEditingController:
                                            usernameController,
                                        labelText: Config.ACCOUNT,
                                        obscureText: false,
                                        prefixIcon: Icons.person,
                                      )),
                            Padding(
                                padding: const EdgeInsets.only(
                                    top: 20, bottom: 10, left: 30, right: 30),
                                child:SigninTextField(
                                          textEditingController:
                                              passwordController,
                                          labelText: Config.PASSWORD,
                                          obscureText: true,
                                          prefixIcon: Icons.lock,
                                          suffixIcon: Icons.visibility,
                                        )),
                            ForgetPasswordButton(
                                text: Config.FORGET_PASSWORD,
                                onClick: () {
                                  BlocProvider.of<SigninBloc>(context)
                                      .add(ClickForgetPasswordEvent());
                                }),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 8,
                            ),
                            SigninButton(
                                text: Config.SIGN_IN.toUpperCase(),
                                onClick: () {
                                  BlocProvider.of<SigninBloc>(context)
                                      .add(ClickSigninEvent(usernameController.text.trim(),passwordController.text.trim()));
                                }),
                          ],
                        ),
                      ),
                    ),
                  ),
                )),
      ),
    );
  }
}
