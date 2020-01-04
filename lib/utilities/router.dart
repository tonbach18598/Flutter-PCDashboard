import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pcdashboard/pages/change_page.dart';
import 'package:flutter_pcdashboard/pages/chat_page.dart';
import 'package:flutter_pcdashboard/pages/comment_page.dart';
import 'package:flutter_pcdashboard/pages/dashboard_page.dart';
import 'package:flutter_pcdashboard/pages/edit_page.dart';
import 'package:flutter_pcdashboard/pages/exam_page.dart';
import 'package:flutter_pcdashboard/pages/feedback_page.dart';
import 'package:flutter_pcdashboard/pages/forget_page.dart';
import 'package:flutter_pcdashboard/pages/home_page.dart';
import 'package:flutter_pcdashboard/pages/post_page.dart';
import 'package:flutter_pcdashboard/pages/schedule_page.dart';
import 'package:flutter_pcdashboard/pages/signin_page.dart';
import 'package:flutter_pcdashboard/pages/splash_page.dart';
import 'package:flutter_pcdashboard/pages/update_page.dart';
import 'package:flutter_pcdashboard/pages/user_page.dart';

class Router{
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
  static const feedbackRoute='/feedback';
  static const chatRoute='/chat';
  static const userRoute='/user';
  static Route<dynamic> generateRoute(RouteSettings settings){
    final arguments = settings.arguments;
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
        case editRoute:
          return CupertinoPageRoute(builder: (_)=>EditPage(arguments));
        case commentRoute:
          return CupertinoPageRoute(builder: (_)=>CommentPage(arguments));
        case scheduleRoute:
          return CupertinoPageRoute(builder: (_)=>SchedulePage());
        case examRoute:
          return CupertinoPageRoute(builder: (_)=>ExamPage());
        case homeRoute:
          return CupertinoPageRoute(builder: (_)=>HomePage());
        case updateRoute:
          return CupertinoPageRoute(builder: (_)=>UpdatePage());
        case changeRoute:
          return CupertinoPageRoute(builder: (_)=>ChangePage());
        case feedbackRoute:
          return CupertinoPageRoute(builder: (_)=>FeedbackPage());
        case chatRoute:
          return CupertinoPageRoute(builder: (_)=>ChatPage());
        case userRoute:
          return CupertinoPageRoute(builder: (_)=>UserPage(arguments));
      }
  }
}