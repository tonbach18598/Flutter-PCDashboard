import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pcdashboard/config.dart';
import 'package:flutter_pcdashboard/pages/account.dart';
import 'package:flutter_pcdashboard/pages/contact.dart';
import 'package:flutter_pcdashboard/pages/department.dart';
import 'package:flutter_pcdashboard/widgets/drawer_item.dart';
import 'package:flutter_pcdashboard/widgets/tab_bar_item.dart';
import 'class.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
              DrawerHeader(
                child: Row(
                  children: <Widget>[
                    Expanded(child: SizedBox(
                        width: MediaQuery.of(context).size.width/3.5,
                        height: MediaQuery.of(context).size.width/3.5,
                        child: CircleAvatar())),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Tôn Bách",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.blue),),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text("1613013",style: TextStyle(fontSize: 18,color: Colors.white),),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.orange,
                ),
              ),
            DashboardDrawerItem(Config.HOME_PAGE,Icons.home),
            DashboardDrawerItem(Config.UPDATE_INFORMATION,Icons.person),
            DashboardDrawerItem(Config.CHANGE_PASSWORD,Icons.vpn_key),
            DashboardDrawerItem(Config.FEEDBACK,Icons.feedback),
            DashboardDrawerItem(Config.SIGN_OUT,Icons.exit_to_app),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: DefaultTabController(
              length: 4,
              child: Column(
                children: <Widget>[
                  Container(
                    constraints: BoxConstraints(maxHeight: 150),
                    child: TabBar(
                      indicatorColor: Colors.orange,
                      unselectedLabelColor: Colors.blue,
                      labelColor: Colors.orange,
                      tabs: <Widget>[
                        DashboardTabBarItem(Config.DEPARTMENT, Icons.fiber_new),
                        DashboardTabBarItem(Config.CLASS, Icons.people),
                        DashboardTabBarItem(Config.CONTACT, Icons.public),
                        DashboardTabBarItem(Config.STUDY, Icons.school)
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
