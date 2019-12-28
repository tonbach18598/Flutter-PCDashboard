import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pcdashboard/pages/comment_page.dart';
import 'package:flutter_pcdashboard/pages/dashboard_page.dart';
import 'package:flutter_pcdashboard/pages/forget_page.dart';
import 'package:flutter_pcdashboard/pages/post_page.dart';
import 'package:flutter_pcdashboard/pages/signin_page.dart';
import 'package:flutter_pcdashboard/pages/splash_page.dart';

class Router{
  static const splashRoute='/';
  static const signinRoute='/signin';
  static const forgetRoute='/forget';
  static const dashboardRoute='/dashboard';
  static const postRoute='/post';
  static const commentRoute='comment';
  static Route<dynamic> generateRoute(RouteSettings settings){
      switch(settings.name){
        case splashRoute:
          return CupertinoPageRoute(builder: (_)=>SplashPage());
        case signinRoute:
          return CupertinoPageRoute(builder: (_)=>SigninPage());
        case dashboardRoute:
          return CupertinoPageRoute(builder: (_)=>DashboardPage());
        case forgetRoute:
          return CupertinoPageRoute(builder: (_)=>ForgetPage());
        case postRoute:
          return CupertinoPageRoute(builder: (_)=>PostPage());
        case commentRoute:
          return CupertinoPageRoute(builder: (_)=>CommentPage());
      }
  }
}