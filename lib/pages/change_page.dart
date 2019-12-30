import 'package:flutter/material.dart';
import 'package:flutter_pcdashboard/utility/value.dart';
import 'package:flutter_pcdashboard/widgets/signin_button.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class ChangePage extends StatefulWidget {
  @override
  _ChangePageState createState() => _ChangePageState();
}

class _ChangePageState extends State<ChangePage> {
  TextEditingController oldController;
  TextEditingController newController;
  TextEditingController reNewController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    oldController=TextEditingController();
    newController=TextEditingController();
    reNewController=TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: Text(Value.CHANGE_PASSWORD.toUpperCase(),style: TextStyle(fontWeight: FontWeight.bold),),
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
        child: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Image.asset("logo.png",width: MediaQuery.of(context).size.width*0.75,height: MediaQuery.of(context).size.width*0.5,),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30,right: 30),
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
                    controller: oldController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.orange,
                      ),
                      hintText: "Mật khẩu cũ"
                    ),
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
                    controller: newController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: Colors.orange,
                        ),
                        hintText: "Mật khẩu mới"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30,20,30,50),
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
                    controller: reNewController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.lock_open,
                          color: Colors.orange,
                        ),
                        hintText: "Nhập lại mật khẩu mới"),
                  ),
                ),
              ),
              SigninButton(
                text: Value.CHANGE_PASSWORD,
                onPress: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
