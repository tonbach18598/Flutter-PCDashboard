import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pcdashboard/utility/value.dart';
import 'package:flutter_pcdashboard/pages/account_page.dart';
import 'package:flutter_pcdashboard/pages/contact_page.dart';
import 'package:flutter_pcdashboard/pages/department_page.dart';
import 'package:flutter_pcdashboard/widgets/drawer_item.dart';
import 'package:flutter_pcdashboard/widgets/oval_right_border_clipper.dart';
import 'package:flutter_pcdashboard/widgets/tab_bar_item.dart';
import 'class_page.dart';

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
      drawer: ClipPath(
        clipper: OvalRightBorderClipper(),
        child: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text("Bùi Ngô Tôn Bách"),
                  accountEmail: Text("1613013"),
                  currentAccountPicture: SizedBox(child: CircleAvatar(),width: 100,height: 100,),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                  ),
                ),
              DashboardDrawerItem(Value.HOME_PAGE,Icons.home),
              DashboardDrawerItem(Value.UPDATE_INFORMATION,Icons.account_circle),
              DashboardDrawerItem(Value.CHANGE_PASSWORD,Icons.settings),
              DashboardDrawerItem(Value.FEEDBACK,Icons.feedback),
              DashboardDrawerItem(Value.SIGN_OUT,Icons.exit_to_app),
            ],
          ),
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
                      indicatorColor: Colors.deepOrangeAccent,
                      unselectedLabelColor: Colors.blue,
                      labelColor: Colors.orange,
                      tabs: <Widget>[
                        DashboardTabBarItem(Value.DEPARTMENT, Icons.fiber_new),
                        DashboardTabBarItem(Value.CLASS, Icons.people),
                        DashboardTabBarItem(Value.CONTACT, Icons.public),
                        DashboardTabBarItem(Value.STUDY, Icons.school)
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

class BoxSize extends StatelessWidget {
  const BoxSize({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar();
  }
}
