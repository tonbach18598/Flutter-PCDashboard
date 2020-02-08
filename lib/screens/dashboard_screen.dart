import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pcdashboard/blocs/dashboard_bloc/dashboard_bloc.dart';
import 'package:flutter_pcdashboard/blocs/dashboard_bloc/dashboard_event.dart';
import 'package:flutter_pcdashboard/blocs/dashboard_bloc/dashboard_state.dart';
import 'package:flutter_pcdashboard/models/responses/self_response.dart';
import 'package:flutter_pcdashboard/utilities/configs.dart';
import 'package:flutter_pcdashboard/utilities/routes.dart';
import 'package:flutter_pcdashboard/utilities/toasts.dart';
import 'package:flutter_pcdashboard/utilities/values.dart';
import 'package:flutter_pcdashboard/screens/study_screen.dart';
import 'package:flutter_pcdashboard/screens/contact_screen.dart';
import 'package:flutter_pcdashboard/screens/department_screen.dart';
import 'package:flutter_pcdashboard/widgets/custom_drawer_item.dart';
import 'package:flutter_pcdashboard/widgets/custom_tab_item.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'class_screen.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  SelfResponse self;
  int currentIndex;
  List<Widget> children;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    self = SelfResponse(userId: '', name: '', avatar: '');
    currentIndex = 0;
    children = [
      DepartmentScreen(),
      ClassScreen(),
      ContactScreen(),
      StudyScreen()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardBloc()..add(InitializeSelfEvent()),
      child: BlocListener<DashboardBloc, DashboardState>(
        listener: (context, state) {
          if (state is InitializeSelfState) {
            self = state.self;
          } else if (state is SuccessTapSelfDetailsState) {
          } else if (state is SuccessTapHomeState) {
            Navigator.of(context).pushNamed(Routes.homeRoute);
          } else if (state is SuccessTapUpdateInformationState) {
            Navigator.of(context).pushNamed(Routes.updateRoute);
          } else if (state is SuccessTapChangePasswordState) {
            Navigator.of(context).pushNamed(Routes.changeRoute);
          } else if (state is SuccessTapDeveloperState) {
            Navigator.of(context).pushNamed(Routes.developerRoute);
          } else if (state is SuccessTapSignoutState) {
            Toasts.showSuccessToast('Đăng xuất thành công');
            Navigator.of(context).pushReplacementNamed(Routes.signinRoute);
          }
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
            drawer: Theme(
              data: Theme.of(context).copyWith(
                canvasColor: Colors.white,
              ),
              child: Drawer(
                child: ListView(
                  // Important: Remove any padding from the ListView.
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    InkWell(
                      child: UserAccountsDrawerHeader(
                        accountName: Text(
                          self.name.toUpperCase(),
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        accountEmail: Text(
                          self.userId,
                          style: TextStyle(fontSize: 14),
                        ),
                        currentAccountPicture: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.width,
                          child: self.avatar != null
                              ? CachedNetworkImage(
                                  imageUrl: self.avatar,
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  placeholder: (context, url) => Center(
                                      child: SpinKitDualRing(
                                    color: Colors.blue,
                                  )),
                                  errorWidget: (context, url, error) => Icon(
                                    Icons.error,
                                    color: Colors.blue,
                                  ),
                                )
                              : Icon(
                                  Icons.error,
                                  color: Colors.blue,
                                ),
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
                      ),
                      onTap: () {},
                    ),
                    CustomDrawerItem(
                        title: Values.HOME_PAGE,
                        icon: Icons.home,
                        onTap: () {
                          BlocProvider.of<DashboardBloc>(context)
                              .add(TapHomeEvent());
                        }),
                    CustomDrawerItem(
                        title: Values.UPDATE_INFORMATION,
                        icon: Icons.account_circle,
                        onTap: () {
                          BlocProvider.of<DashboardBloc>(context)
                              .add(TapUpdateInformationEvent());
                        }),
                    CustomDrawerItem(
                        title: Values.CHANGE_PASSWORD,
                        icon: Icons.settings,
                        onTap: () {
                          BlocProvider.of<DashboardBloc>(context)
                              .add(TapChangePasswordEvent());
                        }),
                    CustomDrawerItem(
                        title: Values.DEVELOPER,
                        icon: Icons.developer_mode,
                        onTap: () {
                          BlocProvider.of<DashboardBloc>(context)
                              .add(TapDeveloperEvent());
                        }),
                    CustomDrawerItem(
                        title: Values.SIGN_OUT,
                        icon: Icons.exit_to_app,
                        onTap: () {
                          BlocProvider.of<DashboardBloc>(context)
                              .add(TapSignoutEvent());
                        }),
                    ListTile(
                      title: Text(
                        Configs.currentVersion,
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            body: children[currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.fiber_new),
                    title: Text(Values.DEPARTMENT)),
                BottomNavigationBarItem(
                    icon: Icon(Icons.people), title: Text(Values.CLASS)),
                BottomNavigationBarItem(
                    icon: Icon(Icons.public), title: Text(Values.CONTACT)),
                BottomNavigationBarItem(
                    icon: Icon(Icons.school), title: Text(Values.STUDY)),
              ],
              selectedItemColor: Colors.deepOrangeAccent,
              unselectedItemColor: Colors.blue,
              type: BottomNavigationBarType.fixed,
              currentIndex: currentIndex,
              backgroundColor: Colors.white,
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
