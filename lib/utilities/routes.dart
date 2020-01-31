import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pcdashboard/screens/change_screen.dart';
import 'package:flutter_pcdashboard/screens/chat_screen.dart';
import 'package:flutter_pcdashboard/screens/comment_screen.dart';
import 'package:flutter_pcdashboard/screens/dashboard_screen.dart';
import 'package:flutter_pcdashboard/screens/edit_screen.dart';
import 'package:flutter_pcdashboard/screens/exam_screen.dart';
import 'package:flutter_pcdashboard/screens/developer_screen.dart';
import 'package:flutter_pcdashboard/screens/forget_screen.dart';
import 'package:flutter_pcdashboard/screens/home_screen.dart';
import 'package:flutter_pcdashboard/screens/signin_screen.dart';
import 'package:flutter_pcdashboard/screens/post_screen.dart';
import 'package:flutter_pcdashboard/screens/schedule_screen.dart';
import 'package:flutter_pcdashboard/screens/splash_screen.dart';
import 'package:flutter_pcdashboard/screens/update_screen.dart';
import 'package:flutter_pcdashboard/screens/user_screen.dart';

class Routes{
  static const splashRoute='/';
  static const signinRoute='/signin';
  static const forgetRoute='/forget';
  static const dashboardRoute='/dashboard';
  static const postRoute='/post';
  static const editRoute='/edit';
  static const commentRoute='/comment';
  static const scheduleRoute='/schedule';
  static const examRoute='/exam';
  static const homeRoute='/home';
  static const updateRoute='/update';
  static const changeRoute='/change';
  static const developerRoute='/developer';
  static const chatRoute='/chat';
  static const userRoute='/user';
  static Route<dynamic> generateRoute(RouteSettings settings){
    final arguments = settings.arguments;
      switch(settings.name){
        case splashRoute:
          return CupertinoPageRoute(builder: (_)=>SplashScreen());
        case signinRoute:
          return CupertinoPageRoute(builder: (_)=>SigninScreen());
        case dashboardRoute:
          return CupertinoPageRoute(builder: (_)=>DashboardScreen());
        case forgetRoute:
          return CupertinoPageRoute(builder: (_)=>ForgetScreen());
        case postRoute:
          return CupertinoPageRoute(builder: (_)=>PostScreen());
        case editRoute:
          return CupertinoPageRoute(builder: (_)=>EditScreen(arguments));
        case commentRoute:
          return CupertinoPageRoute(builder: (_)=>CommentScreen(arguments));
        case scheduleRoute:
          return CupertinoPageRoute(builder: (_)=>ScheduleScreen());
        case examRoute:
          return CupertinoPageRoute(builder: (_)=>ExamScreen());
        case homeRoute:
          return CupertinoPageRoute(builder: (_)=>HomeScreen());
        case updateRoute:
          return CupertinoPageRoute(builder: (_)=>UpdateScreen());
        case changeRoute:
          return CupertinoPageRoute(builder: (_)=>ChangeScreen());
        case developerRoute:
          return CupertinoPageRoute(builder: (_)=>DeveloperScreen());
        case chatRoute:
          return CupertinoPageRoute(builder: (_)=>ChatScreen(arguments));
        case userRoute:
          return CupertinoPageRoute(builder: (_)=>UserScreen(arguments));
      }
  }
}