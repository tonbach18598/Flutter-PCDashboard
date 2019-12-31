import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pcdashboard/blocs/update_bloc/update_bloc.dart';
import 'package:flutter_pcdashboard/blocs/update_bloc/update_event.dart';
import 'package:flutter_pcdashboard/blocs/update_bloc/update_state.dart';
import 'package:flutter_pcdashboard/models/responses/self_response.dart';
import 'package:flutter_pcdashboard/utilities/value.dart';
import 'package:flutter_pcdashboard/widgets/signin_button.dart';
import 'package:flutter_pcdashboard/widgets/update_information_text_field.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class UpdatePage extends StatefulWidget {
  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
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
      create: (context) => UpdateBloc()..add(InitSelfEvent()),
      child: BlocListener<UpdateBloc, UpdateState>(
        listener: (context, state) {
          if (state is InitSelfState) {
            self = state.self;
            classController.text = self.classId;
            emailController.text = self.email;
            phoneController.text = self.phone;
          }
        },
        child: BlocBuilder<UpdateBloc, UpdateState>(
          builder: (context, state) => Scaffold(
            appBar: GradientAppBar(
              title: Text(
                Value.UPDATE_INFORMATION.toUpperCase(),
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
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 20),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.width / 3,
                      child: CachedNetworkImage(
                        imageUrl: self.avatar,
                        imageBuilder: (context, imageProvider) => Container(
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
                        errorWidget: (context, url, error) => Image.asset(
                          "logo.png",
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                    child: UpdateInformationTextField(
                      readOnly: true,
                      prefixIcon: Icon(Icons.people,color: Colors.orange,),
                      borderColor: Colors.orange,
                      hintText: Value.CLASS,
                      controller: classController,
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                      child: UpdateInformationTextField(
                        prefixIcon: Icon(Icons.mail,color: Colors.lightBlue,),
                        borderColor: Colors.lightBlue,
                        hintText: Value.EMAIL,
                        controller: emailController,
                      )
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 20, 30, 30),
                      child: UpdateInformationTextField(
                        prefixIcon: Icon(Icons.smartphone,color: Colors.lightBlue,),
                        borderColor: Colors.lightBlue,
                        hintText: Value.PHONE,
                        controller: phoneController,
                      )
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: SigninButton(
                      text: Value.UPDATE_INFORMATION.toUpperCase(),
                      onPress: () {},
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
