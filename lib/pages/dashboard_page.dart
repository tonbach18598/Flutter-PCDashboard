import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pcdashboard/blocs/dashboard/dashboard_bloc.dart';
import 'package:flutter_pcdashboard/blocs/dashboard/dashboard_event.dart';
import 'package:flutter_pcdashboard/blocs/dashboard/dashboard_state.dart';
import 'package:flutter_pcdashboard/utility/router.dart';
import 'package:flutter_pcdashboard/utility/toast.dart';
import 'package:flutter_pcdashboard/utility/value.dart';
import 'package:flutter_pcdashboard/pages/account_page.dart';
import 'package:flutter_pcdashboard/pages/contact_page.dart';
import 'package:flutter_pcdashboard/pages/department_page.dart';
import 'package:flutter_pcdashboard/widgets/drawer_item.dart';
import 'package:flutter_pcdashboard/widgets/oval_right_border_clipper.dart';
import 'package:flutter_pcdashboard/widgets/tab_bar_item.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'class_page.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) => DashboardBloc(),
      child: BlocListener<DashboardBloc, DashboardState>(
        listener: (context, state) {
          if (state is ClickSelfDetailsDrawerState) {
          } else if (state is ClickHomeDrawerState) {
          } else if (state is ClickUpdateInformationDrawerState) {
          } else if (state is ClickChangePasswordDrawerState) {
          } else if (state is ClickFeedbackDrawerState) {
          } else if (state is ClickSignoutDrawerState) {
            ToastUtil.showSuccessToast("Đăng xuất thành công");
            Navigator.of(context).pushReplacementNamed(Router.signinRoute);          }
        },
        child: BlocBuilder<DashboardBloc, DashboardState>(
          builder: (context, state) => Scaffold(
            appBar: GradientAppBar(
              elevation: 0,
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
            drawer: Drawer(
                child: ListView(
                  // Important: Remove any padding from the ListView.
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    UserAccountsDrawerHeader(
                      accountName: Text(
                        "NGUYỄN HỒNG SỸ NGUYÊN",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      accountEmail: Text(
                        "1613013",
                        style: TextStyle(fontSize: 14),
                      ),
                      currentAccountPicture: SizedBox(
                        child: CircleAvatar(),
                        width: double.infinity,
                        height: double.infinity,
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Colors.deepOrange,
                              Colors.deepOrangeAccent,
                              Colors.orange,
                              Colors.orangeAccent,
                            ],
                            begin: FractionalOffset.bottomLeft,
                            end: FractionalOffset.topRight),
                      ),
                      onDetailsPressed: () {},
                    ),
                    DashboardDrawerItem(
                        title: Value.HOME_PAGE,
                        icon: Icons.home,
                        onClick: () {}),
                    DashboardDrawerItem(
                        title: Value.UPDATE_INFORMATION,
                        icon: Icons.account_circle,
                        onClick: () {}),
                    DashboardDrawerItem(
                        title: Value.CHANGE_PASSWORD,
                        icon: Icons.settings,
                        onClick: () {}),
                    DashboardDrawerItem(
                        title: Value.FEEDBACK,
                        icon: Icons.feedback,
                        onClick: () {}),
                    DashboardDrawerItem(
                        title: Value.SIGN_OUT,
                        icon: Icons.exit_to_app,
                        onClick: () {
                          BlocProvider.of<DashboardBloc>(context)
                              .add(ClickSignoutDrawerEvent());
                        }),
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
                            indicatorColor: Colors.deepOrangeAccent,
                            unselectedLabelColor: Colors.blue,
                            labelColor: Colors.deepOrangeAccent,
                            tabs: <Widget>[
                              DashboardTabBarItem(
                                  Value.DEPARTMENT, Icons.fiber_new),
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
                              HomePage(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
