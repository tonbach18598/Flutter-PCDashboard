import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pcdashboard/blocs/signin_bloc/signin_bloc.dart';
import 'package:flutter_pcdashboard/blocs/signin_bloc/signin_event.dart';
import 'package:flutter_pcdashboard/blocs/signin_bloc/signin_state.dart';
import 'package:flutter_pcdashboard/utilities/values.dart';
import 'package:flutter_pcdashboard/utilities/routes.dart';
import 'package:flutter_pcdashboard/utilities/toasts.dart';
import 'package:flutter_pcdashboard/widgets/loading_signin.dart';
import 'package:flutter_pcdashboard/widgets/logo.dart';
import 'package:flutter_pcdashboard/widgets/forget_password_button.dart';
import 'package:flutter_pcdashboard/widgets/signin_button.dart';
import 'package:flutter_pcdashboard/widgets/signin_text_field.dart';

class SigninScreen extends StatefulWidget {
  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
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
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninBloc(),
      child: BlocListener<SigninBloc, SigninState>(
        listener: (context, state) {
          if (state is SuccessPressSigninState) {
            Toasts.showSuccessToast('Đăng nhập thành công');
            Navigator.of(context).pushReplacementNamed(Routes.dashboardRoute);
          } else if (state is FailurePressSigninState) {
            Toasts.showFailureToast('Đăng nhập thất bại');
          } else if (state is WarningPressSigninState) {
            Toasts.showWarningToast(
                'Tài khoản hoặc mật khẩu không được để trống');
          } else if (state is SuccessPressForgetState) {
            Navigator.of(context).pushNamed(Routes.forgetRoute);
          }
        },
        child: BlocBuilder<SigninBloc, SigninState>(
            builder: (context, state) => Stack(
                  alignment: AlignmentDirectional.center,
                  children: <Widget>[
                    Scaffold(
                      body: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: SingleChildScrollView(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Logo(),
                                Column(
                                  children: <Widget>[
                                    Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            30, 10, 30, 10),
                                        child: SigninTextField(
                                          textEditingController:
                                              usernameController,
                                          labelText: Values.ACCOUNT,
                                          prefixIcon: Icon(Icons.person),
                                        )),
                                    Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            30, 10, 30, 10),
                                        child: SigninTextField(
                                          textEditingController:
                                              passwordController,
                                          labelText: Values.PASSWORD,
                                          obscureText: true,
                                          prefixIcon: Icon(Icons.lock),
                                        )),
                                    ForgetPasswordButton(
                                        title: Values.FORGET_PASSWORD,
                                        onPress: () {
                                          BlocProvider.of<SigninBloc>(context)
                                              .add(PressForgetEvent());
                                        }),
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 10, 0, 10),
                                      child: SigninButton(
                                          title: Values.SIGN_IN.toUpperCase(),
                                          onPress: () {
                                            BlocProvider.of<SigninBloc>(context)
                                                .add(PressSigninEvent(
                                                    usernameController.text
                                                        .trim(),
                                                    passwordController.text
                                                        .trim()));
                                          }),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              10,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    state is LoadingState ? LoadingSignin() : Container()
                  ],
                )),
      ),
    );
  }
}
