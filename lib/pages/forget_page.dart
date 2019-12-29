import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pcdashboard/blocs/forget_bloc/forget_bloc.dart';
import 'package:flutter_pcdashboard/blocs/forget_bloc/forget_event.dart';
import 'package:flutter_pcdashboard/blocs/forget_bloc/forget_state.dart';
import 'package:flutter_pcdashboard/utility/value.dart';
import 'package:flutter_pcdashboard/utility/toast.dart';
import 'package:flutter_pcdashboard/widgets/logo.dart';
import 'package:flutter_pcdashboard/widgets/forget_button.dart';
import 'package:flutter_pcdashboard/widgets/signin_button.dart';
import 'package:flutter_pcdashboard/widgets/signin_text_field.dart';

class ForgetPage extends StatefulWidget {
  @override
  _ForgetPageState createState() => _ForgetPageState();
}

class _ForgetPageState extends State<ForgetPage> {
  TextEditingController usernameController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    usernameController=TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetBloc(),
      child: BlocListener<ForgetBloc, ForgetState>(
        listener: (context, state) {
          if (state is ClickBackState) {
            Navigator.of(context).pop();
          } else if (state is SuccessGetPasswordState) {
            ToastUtil.showSuccessToast("Lấy mật khẩu thành công. Vui lòng kiểm tra trong email");
          }else if(state is FailureGetPasswordState){
            ToastUtil.showFailureToast("Lấy mật khẩu thất bại");
          }else if(state is WarningGetPasswordState){
            ToastUtil.showWarningToast("Tài khoản không được để trống");
          }
        },
        child: BlocBuilder<ForgetBloc, ForgetState>(builder: (context, state)
          => Scaffold(
            body: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                color: Color(0xf5f5f5),
                child: Column(
                  children: <Widget>[
                    Logo(),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 75, bottom: 10, right: 30, left: 30),
                      child: SigninTextField(
                                        textEditingController:
                                            usernameController,
                                        labelText: Value.ACCOUNT,
                                        obscureText: false,
                                        prefixIcon: Icons.person,
                                      )),
                    ForgetPasswordButton(
                      text: Value.BACK,
                      onClick: () {
                        BlocProvider.of<ForgetBloc>(context).add(ClickBackEvent());},
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 8,
                    ),
                    SigninButton(
                      text: Value.GET_PASSWORD,
                      onClick: () {

                      },
                    ),
                  ],
                ),
              ),
            ),
          )
        ),
      ),
    );
  }
}
