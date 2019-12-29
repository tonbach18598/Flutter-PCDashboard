import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pcdashboard/blocs/class_bloc/class_bloc.dart';
import 'package:flutter_pcdashboard/blocs/class_bloc/class_event.dart';
import 'package:flutter_pcdashboard/blocs/class_bloc/class_state.dart';
import 'package:flutter_pcdashboard/models/responses/class_response.dart';
import 'package:flutter_pcdashboard/utility/router.dart';
import 'package:flutter_pcdashboard/utility/toast.dart';
import 'package:flutter_pcdashboard/utility/value.dart';
import 'package:flutter_pcdashboard/widgets/loading_post.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ClassPage extends StatefulWidget {
  @override
  _ClassPageState createState() => _ClassPageState();
}

class _ClassPageState extends State<ClassPage> {
  List<ClassResponse> posts = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ClassBloc()..add(FetchListEvent(10)),
      child: BlocListener<ClassBloc, ClassState>(
        listener: (context, state) {
          if (state is SuccessFetchListState) {
            setState(() {
              posts = state.posts;
            });
          } else if (state is FailureFetchListState) {
            ToastUtil.showFailureToast("Tải bảng tin thất bại");
          }
        },
        child: BlocBuilder<ClassBloc, ClassState>(
          builder: (context, state) => Stack(
            children: <Widget>[
              ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) => Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(25),
                                        child: CachedNetworkImage(
                                          imageUrl: posts[index].userAvatar,
                                          placeholder: (context, url) => Center(
                                              child: SpinKitCircle(
                                            color: Colors.orange,
                                          )),
                                          errorWidget: (context, url, error) =>
                                              Icon(
                                            Icons.error,
                                            color: Colors.orange,
                                          ),
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          posts[index].userName,
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.deepOrange,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Text(
                                            posts[index].time,
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                              child: Text(
                                posts[index].content,
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
                              ),
                            ),
                            posts[index].image != null
                                ? Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: CachedNetworkImage(
                                          imageUrl: posts[index].image,
                                          placeholder: (context, url) => Center(
                                              child: SpinKitCircle(
                                            color: Colors.orange,
                                          )),
                                          errorWidget: (context, url, error) =>
                                              Icon(
                                            Icons.error,
                                            color: Colors.orange,
                                          ),
                                        )),
                                  )
                                : Container(),
                            GestureDetector(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, bottom: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(right: 5),
                                      child: Icon(
                                        Icons.comment,
                                        color: Colors.orange,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Text(
                                        Value.COMMENT,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(Router.commentRoute);
                              },
                            )
                          ],
                        ),
                      )),
              state is LoadingState ? LoadingPost() : Container()
            ],
          ),
        ),
      ),
    );
  }
}
