import 'package:flutter/material.dart';
import 'package:flutter_pcdashboard/utility/value.dart';
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
    return Scaffold(
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
      body: SingleChildScrollView(
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
                text: Value.CHANGE_PASSWORD.toUpperCase(),
                onPress: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
