import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pcdashboard/blocs/update_bloc/update_bloc.dart';
import 'package:flutter_pcdashboard/blocs/update_bloc/update_event.dart';
import 'package:flutter_pcdashboard/blocs/update_bloc/update_state.dart';
import 'package:flutter_pcdashboard/models/responses/self_response.dart';
import 'package:flutter_pcdashboard/utilities/toasts.dart';
import 'package:flutter_pcdashboard/utilities/values.dart';
import 'package:flutter_pcdashboard/widgets/loading_update.dart';
import 'package:flutter_pcdashboard/widgets/signin_button.dart';
import 'package:flutter_pcdashboard/widgets/update_information_text_field.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class UpdateScreen extends StatefulWidget {
  @override
  _UpdateScreenState createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  SelfResponse self;
  TextEditingController classController;
  TextEditingController emailController;
  TextEditingController phoneController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    self = SelfResponse(
        userId: '', name: '', avatar: '', classId: '', email: '', phone: '');
    classController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateBloc()..add(InitializeSelfEvent()),
      child: BlocListener<UpdateBloc, UpdateState>(
        listener: (context, state) {
          if (state is InitializeSelfState) {
            self = state.self;
            classController.text = self.classId;
            emailController.text = self.email;
            phoneController.text = self.phone;
          } else if (state is SuccessPressConfirmState) {
            BlocProvider.of<UpdateBloc>(context).add(InitializeSelfEvent());
            Toasts.showSuccessToast('Cập nhật thông tin thành công');
          } else if (state is WarningEmptyPressConfirmState) {
            Toasts.showWarningToast(
                'Email hoặc số điện thoại không được để trống');
          } else if (state is WarningEmailPressConfirmState) {
            Toasts.showWarningToast('Email không hợp lệ');
          } else if (state is WarningPhonePressConfirmState) {
            Toasts.showWarningToast('Số điện thoại không hợp lệ');
          } else if (state is FailurePressConfirmState) {
            Toasts.showFailureToast('Cập nhật thông tin thất bại');
          }
        },
        child: BlocBuilder<UpdateBloc, UpdateState>(
          builder: (context, state) => Scaffold(
            appBar: GradientAppBar(
              title: Text(
                Values.UPDATE_INFORMATION.toUpperCase(),
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
                          Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width / 3,
                                  height: MediaQuery.of(context).size.width / 3,
                                  child: self.avatar != null
                                      ? CachedNetworkImage(
                                          imageUrl: self.avatar,
                                          imageBuilder:
                                              (context, imageProvider) =>
                                                  Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          placeholder: (context, url) => Center(
                                              child: SpinKitDoubleBounce(
                                            color: Colors.orange,
                                          )),
                                          errorWidget: (context, url, error) =>
                                              Image.asset(
                                            'logo.png',
                                          ),
                                        )
                                      : Image.asset(
                                          'logo.png',
                                        ),
                                ),
                              ),
                              Text(self.name,
                                  style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.deepOrange,
                                      fontWeight: FontWeight.bold)),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Text(self.userId,
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.blueAccent,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(30, 10, 30, 0),
                                  child: UpdateInformationTextField(
                                    readOnly: true,
                                    prefixIcon: Icon(
                                      Icons.people,
                                      color: Colors.orange,
                                    ),
                                    borderColor: Colors.orange,
                                    hintText: Values.CLASS,
                                    controller: classController,
                                  )),
                              Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(30, 10, 30, 0),
                                  child: UpdateInformationTextField(
                                    prefixIcon: Icon(
                                      Icons.mail,
                                      color: Colors.lightBlue,
                                    ),
                                    borderColor: Colors.lightBlue,
                                    hintText: Values.EMAIL,
                                    controller: emailController,
                                  )),
                              Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(30, 10, 30, 0),
                                  child: UpdateInformationTextField(
                                    prefixIcon: Icon(
                                      Icons.smartphone,
                                      color: Colors.lightBlue,
                                    ),
                                    borderColor: Colors.lightBlue,
                                    hintText: Values.PHONE,
                                    controller: phoneController,
                                  )),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                child: SigninButton(
                                  title: Values.CONFIRM.toUpperCase(),
                                  onPress: () {
                                    BlocProvider.of<UpdateBloc>(context).add(
                                        PressConfirmEvent(
                                            emailController.text.trim(),
                                            phoneController.text.trim()));
                                  },
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 10,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                state is LoadingState ? LoadingUpdate() : Container()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
