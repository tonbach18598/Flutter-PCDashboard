import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pcdashboard/blocs/change_bloc/change_bloc.dart';
import 'package:flutter_pcdashboard/blocs/change_bloc/change_event.dart';
import 'package:flutter_pcdashboard/blocs/change_bloc/change_state.dart';
import 'package:flutter_pcdashboard/utilities/routes.dart';
import 'package:flutter_pcdashboard/utilities/toasts.dart';
import 'package:flutter_pcdashboard/utilities/values.dart';
import 'package:flutter_pcdashboard/widgets/loading_update.dart';
import 'package:flutter_pcdashboard/widgets/signin_button.dart';
import 'package:flutter_pcdashboard/widgets/update_information_text_field.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class ChangeScreen extends StatefulWidget {
  @override
  _ChangeScreenState createState() => _ChangeScreenState();
}

class _ChangeScreenState extends State<ChangeScreen> {
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
            Toasts.showSuccessToast('Thay đổi mật khẩu thành công. Vui lòng đăng nhập lại');
            Navigator.of(context).pushReplacementNamed(Routes.signinRoute);
          }else if(state is WarningEmptyPressConfirmState){
            Toasts.showWarningToast('Mật khẩu cũ hoặc mới không được để trống');
          }else if(state is WarningPasswordPressConfirmState){
            Toasts.showWarningToast('Mật khẩu không hợp lệ');
          }else if(state is WarningMatchPressConfirmState){
            Toasts.showWarningToast('Mật khẩu mới nhập lại không khớp');
          }else if(state is FailurePressConfirmState){
            Toasts.showFailureToast('Thay đổi mật khẩu thất bại');
          }
        },
        child: BlocBuilder<ChangeBloc,ChangeState>(
          builder:(context,state)=> Scaffold(
            appBar: GradientAppBar(
              title: Text(
                Values.CHANGE_PASSWORD.toUpperCase(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
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
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: SingleChildScrollView(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Image.asset(
                                  'logo.png',
                                  width: MediaQuery.of(context).size.width *0.6,
                                  height: MediaQuery.of(context).size.width *0.4,
                                ),
                          Column(
                            children: <Widget>[
                              Padding(
                                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                                  child: UpdateInformationTextField(
                                    obscureText: true,
                                    prefixIcon: Icon(
                                      Icons.vpn_key,
                                      color: Colors.orange,
                                    ),
                                    borderColor: Colors.orange,
                                    hintText: Values.OLD_PASSWORD,
                                    controller: oldController,
                                  )),
                              Padding(
                                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                                  child: UpdateInformationTextField(
                                    obscureText: true,
                                    prefixIcon: Icon(
                                      Icons.lock_open,
                                      color: Colors.lightBlue,
                                    ),
                                    borderColor: Colors.lightBlue,
                                    hintText: Values.NEW_PASSWORD,
                                    controller: newController,
                                  )),
                              Padding(
                                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                                  child: UpdateInformationTextField(
                                    obscureText: true,
                                    prefixIcon: Icon(
                                      Icons.lock_outline,
                                      color: Colors.lightBlue,
                                    ),
                                    borderColor: Colors.lightBlue,
                                    hintText: Values.RETYPE_PASSWORD,
                                    controller: retypeController,
                                  )),
                              SizedBox(
                                height: MediaQuery.of(context).size.height/10,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                child: SigninButton(
                                  title: Values.CONFIRM.toUpperCase(),
                                  onPress: () {BlocProvider.of<ChangeBloc>(context).add(PressConfirmEvent(oldController.text.trim(),newController.text.trim(),retypeController.text.trim()));},
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height/10,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
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