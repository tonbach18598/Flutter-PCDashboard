import 'package:flutter/material.dart';
import 'package:flutter_pcdashboard/pages/account.dart';
import 'package:flutter_pcdashboard/pages/contact.dart';
import 'package:flutter_pcdashboard/pages/department.dart';
import 'package:flutter_pcdashboard/widgets/tab.dart';

import 'class.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/10,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Colors.orange,
                      Colors.orangeAccent,
                      Colors.white,
                    ],
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter)
            ),
          ),
          Expanded(
            child: DefaultTabController(
              length: 4,
              child: Column(
                children: <Widget>[
                  Container(
                    constraints: BoxConstraints(maxHeight: 150),
                    child: TabBar(
                      indicatorColor: Colors.deepOrangeAccent,
                      unselectedLabelColor: Colors.blue,
                      labelColor: Colors.orange,
                      tabs: <Widget>[
                        DashboardTabBar("Bộ môn", Icons.home),
                        DashboardTabBar("Lớp học", Icons.school),
                        DashboardTabBar("Liên hệ", Icons.people),
                        DashboardTabBar("Tài khoản", Icons.account_circle)
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: <Widget>[
                        DepartmentPage(),
                        ClassPage(),
                        ContactPage(),
                        AccountPage(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
