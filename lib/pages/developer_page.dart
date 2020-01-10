import 'package:flutter/material.dart';
import 'package:flutter_pcdashboard/utilities/values.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class DeveloperPage extends StatefulWidget {
  @override
  _DeveloperPageState createState() => _DeveloperPageState();
}

class _DeveloperPageState extends State<DeveloperPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: Text(
          Values.DEVELOPER.toUpperCase(),
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
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Image.asset('logo.png',width: MediaQuery.of(context).size.height/3,height: MediaQuery.of(context).size.height/3,),
              RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(text: "P", style: TextStyle(color: Colors.deepOrange, fontSize: 24, fontWeight: FontWeight.bold,)),
                      TextSpan(text: "&", style: TextStyle(color: Colors.deepOrange, fontSize: 18, fontWeight: FontWeight.bold,)),
                      TextSpan(text: "C Dashboard Student", style: TextStyle(color: Colors.deepOrange, fontSize: 24, fontWeight: FontWeight.bold,)),
                      TextSpan(text: " là ứng dụng quản lý và hỗ trợ học tập dành cho sinh viên bộ môn Vật lý Tin học.", style: TextStyle(fontSize: 22,color: Colors.black)),
                    ]
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(text: "Ứng dụng được viết trên nền tảng ", style: TextStyle(fontSize: 22,color: Colors.black)),
                      TextSpan(text: "Flutter", style: TextStyle(fontSize: 24,color: Colors.blueAccent, fontWeight: FontWeight.bold,)),
                      TextSpan(text: " bằng ngôn ngữ ", style: TextStyle(fontSize: 22,color: Colors.black)),
                      TextSpan(text: "Dart", style: TextStyle(fontSize: 24,color: Colors.blueAccent, fontWeight: FontWeight.bold,)),
                      TextSpan(text: ".", style: TextStyle(fontSize: 22,color: Colors.black)),
                    ]
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(text: "Đây là đề tài khoá luận tốt nghiệp của sinh viên ", style: TextStyle(color: Colors.black, fontSize: 22)),
                      TextSpan(text: "Bùi Ngô Tôn Bách", style: TextStyle(fontSize: 24,color: Colors.deepOrange, fontWeight: FontWeight.bold,)),
                      TextSpan(text: ", khoá K16.", style: TextStyle(fontSize: 22,color: Colors.black)),
                    ]
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
