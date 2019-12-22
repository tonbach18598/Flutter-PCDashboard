import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pcdashboard/blocs/forget/forget_bloc.dart';
import 'package:flutter_pcdashboard/blocs/forget/forget_event.dart';
import 'package:flutter_pcdashboard/blocs/forget/forget_state.dart';
import 'package:flutter_pcdashboard/blocs/forget/forget_stream.dart';
import 'package:flutter_pcdashboard/config.dart';
import 'package:flutter_pcdashboard/widgets/logo.dart';
import 'package:flutter_pcdashboard/widgets/forget_button.dart';
import 'package:flutter_pcdashboard/widgets/signin_button.dart';
import 'package:flutter_pcdashboard/widgets/signin_text_field.dart';

class ForgetPage extends StatefulWidget {
  @override
  _ForgetPageState createState() => _ForgetPageState();
}

class _ForgetPageState extends State<ForgetPage> {
  ForgetStream forgetStream;
  TextEditingController usernameController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forgetStream=ForgetStream();
    usernameController=TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    forgetStream.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) => ForgetBloc(),
      child: BlocListener<ForgetBloc, ForgetState>(
        listener: (context, state) {
          if (state is ClickBackState) {
            Navigator.of(context).pop();
          } else if (state is ClickGetPasswordState) {}
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
                      height: MediaQuery.of(context).size.height / 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 75, bottom: 10, right: 30, left: 30),
                      child: StreamBuilder(
                        stream: forgetStream.usernameStream,
                        builder: (context,snapshot)=>
                         SigninTextField(
                                        textEditingController:
                                            usernameController,
                                        labelText: Config.ACCOUNT,
                                        obscureText: false,
                                        prefixIcon: Icons.person,
                                        errorText: snapshot.hasError
                                            ? snapshot.error
                                            : null,
                                      )),
                    ),
                    ForgetPasswordButton(
                      text: Config.BACK,
                      onClick: () {BlocProvider.of<ForgetBloc>(context).add(ClickBackEvent());},
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height / 8,
                    ),
                    SigninButton(
                      text: Config.GET_PASSWORD,
                      onClick: () {},
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
