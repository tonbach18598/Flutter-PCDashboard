import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pcdashboard/blocs/signin_bloc/signin_bloc.dart';
import 'package:flutter_pcdashboard/blocs/signin_bloc/signin_event.dart';
import 'package:flutter_pcdashboard/blocs/signin_bloc/signin_state.dart';
import 'package:flutter_pcdashboard/utility/value.dart';
import 'package:flutter_pcdashboard/utility/router.dart';
import 'package:flutter_pcdashboard/utility/toast.dart';
import 'package:flutter_pcdashboard/widgets/loading_signin.dart';
import 'package:flutter_pcdashboard/widgets/logo.dart';
import 'package:flutter_pcdashboard/widgets/forget_button.dart';
import 'package:flutter_pcdashboard/widgets/signin_button.dart';
import 'package:flutter_pcdashboard/widgets/signin_text_field.dart';

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
      create: (context) => SigninBloc(),
      child: BlocListener<SigninBloc, SigninState>(
        listener: (context, state) {
          if (state is SuccessPressSigninState) {
            ToastUtil.showSuccessToast("Đăng nhập thành công");
            Navigator.of(context).pushReplacementNamed(Router.dashboardRoute);
          } else if(state is FailurePressSigninState){
            ToastUtil.showFailureToast("Đăng nhập thất bại");
          } else if(state is WarningPressSigninState){
            ToastUtil.showWarningToast("Tài khoản hoặc mật khẩu không được để trống");
          }
          else if (state is PressForgetState) {
            Navigator.of(context).pushNamed(Router.forgetRoute);
          }
        },
        child: BlocBuilder<SigninBloc, SigninState>(
            builder: (context, state) => Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                Scaffold(
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
                                            labelText: Value.ACCOUNT,
                                            obscureText: false,
                                            prefixIcon: Icons.person,
                                          )),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, bottom: 10, left: 30, right: 30),
                                    child:SigninTextField(
                                              textEditingController:
                                                  passwordController,
                                              labelText: Value.PASSWORD,
                                              obscureText: true,
                                              prefixIcon: Icons.lock,
                                              suffixIcon: Icons.visibility,
                                            )),
                                ForgetPasswordButton(
                                    text: Value.FORGET_PASSWORD,
                                    onPress: () {
                                      BlocProvider.of<SigninBloc>(context)
                                          .add(PressForgetEvent());
                                    }),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height / 8,
                                ),
                                SigninButton(
                                    text: Value.SIGN_IN.toUpperCase(),
                                    onPress: () {
                                      BlocProvider.of<SigninBloc>(context)
                                          .add(PressSigninEvent(usernameController.text.trim(),passwordController.text.trim()));
                                    }),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                state is LoadingState?LoadingSignin():Container()
              ],
            )),
      ),
    );
  }
}
