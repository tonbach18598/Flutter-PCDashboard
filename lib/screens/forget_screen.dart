import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pcdashboard/blocs/forget_bloc/forget_bloc.dart';
import 'package:flutter_pcdashboard/blocs/forget_bloc/forget_event.dart';
import 'package:flutter_pcdashboard/blocs/forget_bloc/forget_state.dart';
import 'package:flutter_pcdashboard/utilities/values.dart';
import 'package:flutter_pcdashboard/utilities/toasts.dart';
import 'package:flutter_pcdashboard/widgets/loading_signin.dart';
import 'package:flutter_pcdashboard/widgets/logo.dart';
import 'package:flutter_pcdashboard/widgets/forget_password_button.dart';
import 'package:flutter_pcdashboard/widgets/signin_button.dart';
import 'package:flutter_pcdashboard/widgets/signin_text_field.dart';

class ForgetScreen extends StatefulWidget {
  @override
  _ForgetScreenState createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
  TextEditingController usernameController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    usernameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetBloc(),
      child: BlocListener<ForgetBloc, ForgetState>(
        listener: (context, state) {
          if (state is SuccessPressBackState) {
            Navigator.of(context).pop();
          } else if (state is SuccessPressGetPasswordState) {
            usernameController.text = '';
            Toasts.showSuccessToast(
                'Lấy mật khẩu thành công. Vui lòng kiểm tra trong email');
          } else if (state is FailurePressGetPasswordState) {
            Toasts.showFailureToast('Lấy mật khẩu thất bại');
          } else if (state is WarningPressGetPasswordState) {
            Toasts.showWarningToast('Tài khoản không được để trống');
          }
        },
        child: BlocBuilder<ForgetBloc, ForgetState>(
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
                                            30,10,30,10),
                                        child: SigninTextField(
                                          textEditingController: usernameController,
                                          labelText: Values.ACCOUNT,
                                          prefixIcon: Icon(Icons.person),
                                        )),
                                    ForgetPasswordButton(
                                      title: Values.BACK,
                                      onPress: () {
                                        BlocProvider.of<ForgetBloc>(context)
                                            .add(PressBackEvent());
                                      },
                                    ),
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(0,10,0,10),
                                      child: SigninButton(
                                        title: Values.GET_PASSWORD.toUpperCase(),
                                        onPress: () {
                                          BlocProvider.of<ForgetBloc>(context).add(
                                              PressGetPasswordEvent(
                                                  usernameController.text.trim()));
                                        },
                                      ),
                                    ),
                                    SizedBox(height: MediaQuery.of(context).size.height/10,)
                                  ],
                                )
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
