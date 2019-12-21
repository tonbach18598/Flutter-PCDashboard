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
import 'package:flutter_pcdashboard/widgets/login_button.dart';
import 'package:flutter_pcdashboard/widgets/login_text_field.dart';

class SigninPage extends StatefulWidget {
  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) => SigninBloc(),
      child: BlocListener<SigninBloc, SigninState>(
        listener: (context, state) {
          if (state is ClickSigninState) {
            Navigator.of(context).pushNamed(Router.dashboardRoute);
          } else if (state is ClickForgetPasswordState) {
            Navigator.of(context).pushNamed(Router.forgetRoute);
          }
        },
        child: BlocBuilder<SigninBloc, SigninState>(builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                color: Color(0xf5f5f5),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Logo(),
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
                                .add(ClickSigninEvent());
                          }),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
