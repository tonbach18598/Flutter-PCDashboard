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
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:qr_flutter/qr_flutter.dart';
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
              title: Text(
                Values.PHYSICS_COMPUTER_SCIENCE.toUpperCase(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
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
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.home,
                        color: Colors.orange,
                      ),
                      title: Text(
                        Values.HOME_PAGE,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        BlocProvider.of<DashboardBloc>(context)
                            .add(TapHomeEvent());
                      },
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.account_circle,
                        color: Colors.orange,
                      ),
                      title: Text(
                        Values.UPDATE_INFORMATION,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        BlocProvider.of<DashboardBloc>(context)
                            .add(TapUpdateInformationEvent());
                      },
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.settings,
                        color: Colors.orange,
                      ),
                      title: Text(
                        Values.CHANGE_PASSWORD,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        BlocProvider.of<DashboardBloc>(context)
                            .add(TapChangePasswordEvent());
                      },
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.developer_mode,
                        color: Colors.orange,
                      ),
                      title: Text(
                        Values.DEVELOPER,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        BlocProvider.of<DashboardBloc>(context)
                            .add(TapDeveloperEvent());
                      },
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.exit_to_app,
                        color: Colors.orange,
                      ),
                      title: Text(
                        Values.SIGN_OUT,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        BlocProvider.of<DashboardBloc>(context)
                            .add(TapSignoutEvent());
                      },
                    ),
                    ListTile(
                      title: Text(
                        Configs.currentVersion,
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          QrImage(
                              data: self.userId,
                              version: QrVersions.auto,
                              size: 120,
                              gapless: false,
                              embeddedImage: AssetImage('assets/logo.png'),
                              embeddedImageStyle: QrEmbeddedImageStyle(
                                size: Size(30, 30),
                              ),
                            ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            body: children[currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.fiber_new),
                    title: Text(
                      Values.DEPARTMENT,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    )),
                BottomNavigationBarItem(
                    icon: Icon(Icons.people),
                    title: Text(
                      Values.CLASS,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    )),
                BottomNavigationBarItem(
                    icon: Icon(Icons.public),
                    title: Text(
                      Values.CONTACT,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    )),
                BottomNavigationBarItem(
                    icon: Icon(Icons.school),
                    title: Text(
                      Values.STUDY,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    )),
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
