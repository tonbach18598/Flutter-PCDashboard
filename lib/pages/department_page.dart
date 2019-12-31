import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pcdashboard/blocs/department_bloc/department_bloc.dart';
import 'package:flutter_pcdashboard/blocs/department_bloc/department_event.dart';
import 'package:flutter_pcdashboard/blocs/department_bloc/department_state.dart';
import 'package:flutter_pcdashboard/models/responses/department_response.dart';
import 'package:flutter_pcdashboard/utilities/toast.dart';
import 'package:flutter_pcdashboard/widgets/loading_post.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DepartmentPage extends StatefulWidget {
  @override
  _DepartmentPageState createState() => _DepartmentPageState();
}

class _DepartmentPageState extends State<DepartmentPage> {
  List<DepartmentResponse> posts = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DepartmentBloc()..add(FetchListEvent(10)),
      child: BlocListener<DepartmentBloc, DepartmentState>(
        listener: (context, state) {
          if (state is SuccessFetchListState) {
              posts = state.posts;
          } else if (state is FailureFetchListState) {
            ToastUtil.showFailureToast("Tải bảng tin thất bại");
          }
        },
        child: BlocBuilder<DepartmentBloc, DepartmentState>(
            builder: (context, state) {
          return Stack(
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
                              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                              child: Text(
                                posts[index].title,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.deepOrange,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                              child: Text(
                                posts[index].time,
                                style:
                                    TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                              child: Text(
                                posts[index].content,
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
                              ),
                            ),
                            posts[index].image != null
                                ? Padding(
                                    padding: const EdgeInsets.fromLTRB(5,0,5,5),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: CachedNetworkImage(
                                        imageUrl: posts[index].image,
                                        placeholder: (context, url) => Center(
                                            child: SpinKitCircle(
                                          color: Colors.orange,
                                        )),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                      ),
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      )),
              state is LoadingState ? LoadingPost() : Container()
            ],
          );
        }),
      ),
    );
  }
}
