import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pcdashboard/blocs/user_bloc/user_bloc.dart';
import 'package:flutter_pcdashboard/blocs/user_bloc/user_event.dart';
import 'package:flutter_pcdashboard/blocs/user_bloc/user_state.dart';
import 'package:flutter_pcdashboard/models/responses/user_response.dart';
import 'package:flutter_pcdashboard/utilities/toasts.dart';
import 'package:flutter_pcdashboard/utilities/values.dart';
import 'package:flutter_pcdashboard/widgets/loading_user.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class UserPage extends StatefulWidget {
  final arguments;

  UserPage(this.arguments);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  String classId;
  List<UserResponse> users = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    classId = widget.arguments;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc()..add(FetchListEvent(classId)),
      child: BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          if (state is SuccessFetchListState) {
            users = state.users;
          } else if (state is FailureFetchListState) {
            classId == 'GV'
                ? Toasts.showFailureToast(
                    'Tải danh sách giảng viên thất bại')
                : Toasts.showFailureToast(
                    'Tải danh sách sinh viên thất bại');
          } else if (state is TapUserState) {
            showInformationBottomSheet(context, state.user);
          }
        },
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) => Scaffold(
              appBar: GradientAppBar(
                title: Text(
                  classId == 'GV'
                      ? Values.TEACHER_LIST.toUpperCase()
                      : Values.STUDENT_LIST.toUpperCase(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                elevation: 0,
                automaticallyImplyLeading: true,
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
              body: Stack(
                children: <Widget>[
                  ListView.builder(
                      itemCount: users.length,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) => InkWell(
                            child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(30, 10, 30, 10),
                                  child: Row(
                                    children: <Widget>[
                                      CachedNetworkImage(
                                        imageUrl: users[index].avatar,
                                        imageBuilder:
                                            (context, imageProvider) =>
                                                Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              6,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              6,
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
                                      SizedBox(width: 20),
                                      Expanded(
                                          child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            '${users[index].name}',
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.deepOrange,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5),
                                            child: Text(
                                              '${users[index].userId}',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.blueAccent,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )
                                        ],
                                      ))
                                    ],
                                  ),
                                )),
                            onTap: () {
                              BlocProvider.of<UserBloc>(context).add(TapUserEvent(users[index]));
                            },
                          )),
                  state is LoadingState ? LoadingUser() : Container()
                ],
              )),
        ),
      ),
    );
  }

  Future<void> showInformationBottomSheet(BuildContext blocContext,UserResponse use) async {
    return showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.5,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0,10,0,10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CachedNetworkImage(
                        imageUrl: use.avatar,
                        imageBuilder: (context, imageProvider) => Container(
                          width: MediaQuery.of(context).size.width / 3,
                          height: MediaQuery.of(context).size.width / 3,
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
                          color: Colors.orange,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0,20,0,10),
                        child: Text('${use.name}',style: TextStyle(fontSize: 20,color: Colors.deepOrange,fontWeight: FontWeight.bold),),
                      ),
                      Text('${use.userId}',style: TextStyle(fontSize: 16,color: Colors.blueAccent,fontWeight: FontWeight.bold),),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Icon(Icons.email,color: Colors.orange,),
                                    ),
                                    Text('${use.email}',style: TextStyle(fontSize: 16),),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Icon(Icons.smartphone,color: Colors.orange,),
                                    ),
                                    Text('${use.phone}',style: TextStyle(fontSize: 16),)
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
              ));
        });
  }
}
