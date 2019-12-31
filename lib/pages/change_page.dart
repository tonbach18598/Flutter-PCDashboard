import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pcdashboard/blocs/change_bloc/change_bloc.dart';
import 'package:flutter_pcdashboard/blocs/change_bloc/change_event.dart';
import 'package:flutter_pcdashboard/blocs/change_bloc/change_state.dart';
import 'package:flutter_pcdashboard/utilities/router.dart';
import 'package:flutter_pcdashboard/utilities/toast.dart';
import 'package:flutter_pcdashboard/utilities/value.dart';
import 'package:flutter_pcdashboard/widgets/loading_update.dart';
import 'package:flutter_pcdashboard/widgets/signin_button.dart';
import 'package:flutter_pcdashboard/widgets/update_information_text_field.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class ChangePage extends StatefulWidget {
  @override
  _ChangePageState createState() => _ChangePageState();
}

class _ChangePageState extends State<ChangePage> {
  TextEditingController oldController;
  TextEditingController newController;
  TextEditingController retypeController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    oldController = TextEditingController();
    newController = TextEditingController();
    retypeController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>ChangeBloc(),
      child: BlocListener<ChangeBloc,ChangeState>(
        listener: (context,state){
          if(state is SuccessPressConfirmState){
            ToastUtil.showSuccessToast('Thay đổi mật khẩu thành công. Vui lòng đăng nhập lại');
            Navigator.of(context).pushReplacementNamed(Router.signinRoute);
          }else if(state is WarningEmptyPressConfirmState){
            ToastUtil.showWarningToast('Mật khẩu cũ hoặc mới không được để trống');
          }else if(state is WarningPasswordPressConfirmState){
            ToastUtil.showWarningToast('Mật khẩu không hợp lệ');
          }else if(state is WarningMatchPressConfirmState){
            ToastUtil.showWarningToast('Mật khẩu mới nhập lại không khớp');
          }else if(state is FailurePressConfirmState){
            ToastUtil.showFailureToast('Thay đổi mật khẩu thất bại');
          }
        },
        child: BlocBuilder<ChangeBloc,ChangeState>(
          builder:(context,state)=> Scaffold(
            appBar: GradientAppBar(
              title: Text(
                Value.CHANGE_PASSWORD.toUpperCase(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              elevation: 0,
              automaticallyImplyLeading: true,
              gradient: LinearGradient(
                  colors: [
                    Colors.deepOrange,
                    Colors.deepOrangeAccent,
                    Colors.orange,
                    Colors.orangeAccent,
                  ],
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter),
            ),
            body: Stack(
              children: <Widget>[
                SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Image.asset(
                          "logo.png",
                          width: MediaQuery.of(context).size.width * 0.75,
                          height: MediaQuery.of(context).size.width * 0.5,
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: UpdateInformationTextField(
                            prefixIcon: Icon(
                              Icons.vpn_key,
                              color: Colors.orange,
                            ),
                            borderColor: Colors.orange,
                            hintText: Value.OLD_PASSWORD,
                            controller: oldController,
                          )),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                          child: UpdateInformationTextField(
                            prefixIcon: Icon(
                              Icons.lock_open,
                              color: Colors.lightBlue,
                            ),
                            borderColor: Colors.lightBlue,
                            hintText: Value.NEW_PASSWORD,
                            controller: newController,
                          )),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(30, 20, 30, 50),
                          child: UpdateInformationTextField(
                            prefixIcon: Icon(
                              Icons.lock_outline,
                              color: Colors.lightBlue,
                            ),
                            borderColor: Colors.lightBlue,
                            hintText: Value.RETYPE_PASSWORD,
                            controller: retypeController,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: SigninButton(
                          text: Value.CONFIRM.toUpperCase(),
                          onPress: () {BlocProvider.of<ChangeBloc>(context).add(PressConfirmEvent(oldController.text,newController.text,retypeController.text));},
                        ),
                      )
                    ],
                  ),
                ),
                state is LoadingState?LoadingUpdate():Container()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
