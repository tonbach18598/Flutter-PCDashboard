import 'package:flutter/material.dart';
import 'package:flutter_pcdashboard/pages/login.dart';

import '../widgets/splashscreen.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: LoginPage(),
      image: Image.asset("logo.png",width: 300,height: 240,),
      photoSize: 240,
      loaderColor: Colors.orangeAccent,
      loadingText: Text("Vui lòng đợi...",style: TextStyle(color: Colors.deepOrange),),
      gradientBackground: LinearGradient(
          colors: [Colors.deepOrange,Colors.deepOrangeAccent,Colors.orange,Colors.orangeAccent,Colors.white,Colors.lightBlueAccent,Colors.lightBlue,Colors.blue,Colors.blueAccent],
          begin: FractionalOffset.topLeft,
          end: FractionalOffset.bottomRight),
    );
  }
}
