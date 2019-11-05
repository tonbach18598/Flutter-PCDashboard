import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pcdashboard/pages/dashboard.dart';
import 'package:flutter_pcdashboard/pages/forget.dart';
import 'package:flutter_pcdashboard/pages/login.dart';

class PageNavigator{
  static PageNavigator _instance;
  static final String LOGIN_PAGE="LOGIN_PAGE";
  static final String FORGET_PAGE="FORGET_PAGE";
  static final String DASHBOARD_PAGE="DASHBOARD_PAGE";
  static PageNavigator getInstance(){
    if(_instance==null)
      _instance=PageNavigator();
    return _instance;
  }

  void navigate(BuildContext context,String page){
    switch(page){
      case "FORGET_PAGE":
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ForgetPage()));
        break;
      case "LOGIN_PAGE":
        Navigator.of(context).pop();
        break;
      case "DASHBOARD_PAGE":
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DashboardPage()));
        break;
    }
  }
}