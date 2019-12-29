import 'package:flutter/material.dart';
import 'package:flutter_pcdashboard/utility/value.dart';
import 'package:flutter_pcdashboard/widgets/signin_button.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class UpdatePage extends StatefulWidget {
  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  TextEditingController classController;
  TextEditingController emailController;
  TextEditingController phoneController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    classController=TextEditingController();
    emailController=TextEditingController();
    phoneController=TextEditingController();
    classController.text="K16";
    emailController.text="tonbach18598@gmail.com";
    phoneController.text="01234566789";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                padding: const EdgeInsets.only(top: 30,bottom: 20),
                child: SizedBox(
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.width / 3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.width / 6),
                      child: CircleAvatar(),
                    )),
              ),
              Column(
                children: <Widget>[
                  Text("BÙI NGÔ TÔN BÁCH",
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold)),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text("1613013",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.blueAccent,fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30,20,30,0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Colors.orange
                      ),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white
                  ),
                  child: TextField(
                    readOnly: true,
                    controller: classController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.people,
                          color: Colors.orange,
                        ),),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30,20,30,0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 2,
                          color: Colors.blue
                      ),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white
                  ),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.orange,
                        ),
                        hintText: "Email"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30,20,30,30),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 2,
                          color: Colors.blue
                      ),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white
                  ),
                  child: TextField(
                    controller: phoneController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.smartphone,
                          color: Colors.orange,
                        ),
                        hintText: "Số điện thoại"),
                  ),
                ),
              ),
              SigninButton(
                text: Value.UPDATE_INFORMATION,
                onClick: () {},
              )
            ],
          ),
      ),
    );
  }
}
