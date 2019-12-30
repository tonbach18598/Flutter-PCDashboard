import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pcdashboard/blocs/dashboard_bloc/dashboard_bloc.dart';
import 'package:flutter_pcdashboard/blocs/dashboard_bloc/dashboard_event.dart';
import 'package:flutter_pcdashboard/blocs/dashboard_bloc/dashboard_state.dart';
import 'package:flutter_pcdashboard/models/responses/self_response.dart';
import 'package:flutter_pcdashboard/utility/router.dart';
import 'package:flutter_pcdashboard/utility/toast.dart';
import 'package:flutter_pcdashboard/utility/value.dart';
import 'package:flutter_pcdashboard/pages/study_page.dart';
import 'package:flutter_pcdashboard/pages/contact_page.dart';
import 'package:flutter_pcdashboard/pages/department_page.dart';
import 'package:flutter_pcdashboard/widgets/drawer_item.dart';
import 'package:flutter_pcdashboard/widgets/tab_bar_item.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'class_page.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  SelfResponse self;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    self = SelfResponse(userId: '', name: '', avatar: '');
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardBloc()..add(InitSelfEvent()),
      child: BlocListener<DashboardBloc, DashboardState>(
        listener: (context, state) {
          if (state is InitSelfState) {
            self = state.self;
          } else if (state is TapSelfDetailsState) {
          } else if (state is TapHomeState) {
            Navigator.of(context).pushNamed(Router.homeRoute);
          } else if (state is TapUpdateInformationState) {
            Navigator.of(context).pushNamed(Router.updateRoute);
          } else if (state is TapChangePasswordState) {
            Navigator.of(context).pushNamed(Router.changeRoute);
          } else if (state is TapFeedbackState) {
            Navigator.of(context).pushNamed(Router.feedbackRoute);
          } else if (state is TapSignoutState) {
            ToastUtil.showSuccessToast("Đăng xuất thành công");
            Navigator.of(context).pushReplacementNamed(Router.signinRoute);
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
            drawer: Drawer(
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
                        child: CachedNetworkImage(
                          imageUrl: self.avatar,
                          imageBuilder:
                              (context, imageProvider) =>
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
                          errorWidget: (context, url, error) =>
                              Icon(
                                Icons.error,
                                color: Colors.orange,
                              ),
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
                  DashboardDrawerItem(
                      title: Value.HOME_PAGE,
                      icon: Icons.home,
                      onTap: () {
                        BlocProvider.of<DashboardBloc>(context)
                            .add(TapHomeEvent());
                      }),
                  DashboardDrawerItem(
                      title: Value.UPDATE_INFORMATION,
                      icon: Icons.account_circle,
                      onTap: () {
                        BlocProvider.of<DashboardBloc>(context)
                            .add(TapUpdateInformationEvent());
                      }),
                  DashboardDrawerItem(
                      title: Value.CHANGE_PASSWORD,
                      icon: Icons.settings,
                      onTap: () {
                        BlocProvider.of<DashboardBloc>(context)
                            .add(TapChangePasswordEvent());
                      }),
                  DashboardDrawerItem(
                      title: Value.FEEDBACK,
                      icon: Icons.feedback,
                      onTap: () {
                        BlocProvider.of<DashboardBloc>(context)
                            .add(TapFeedbackEvent());
                      }),
                  DashboardDrawerItem(
                      title: Value.SIGN_OUT,
                      icon: Icons.exit_to_app,
                      onTap: () {
                        BlocProvider.of<DashboardBloc>(context)
                            .add(TapSignoutEvent());
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
                              StudyPage(),
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
