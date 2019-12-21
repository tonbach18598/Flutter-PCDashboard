import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pcdashboard/pages/dashboard.dart';
import 'package:flutter_pcdashboard/pages/forget.dart';
import 'package:flutter_pcdashboard/pages/signin.dart';
import 'package:flutter_pcdashboard/pages/splash.dart';

class Router{
  static const splashRoute='/';
  static const loginRoute='/login';
  static const forgetRoute='/forget';
  static const dashboardRoute='/dashboard';
  static Route<dynamic> generateRoute(RouteSettings settings){
      switch(settings.name){
        case splashRoute:
          return CupertinoPageRoute(builder: (_)=>SplashPage());
        case loginRoute:
          return CupertinoPageRoute(builder: (_)=>SigninPage());
        case dashboardRoute:
          return CupertinoPageRoute(builder: (_)=>DashboardPage());
        case forgetRoute:
          return CupertinoPageRoute(builder: (_)=>ForgetPage());
      }
  }
}