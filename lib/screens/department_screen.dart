import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pcdashboard/blocs/department_bloc/department_bloc.dart';
import 'package:flutter_pcdashboard/blocs/department_bloc/department_event.dart';
import 'package:flutter_pcdashboard/blocs/department_bloc/department_state.dart';
import 'package:flutter_pcdashboard/models/responses/department_response.dart';
import 'package:flutter_pcdashboard/utilities/toasts.dart';
import 'package:flutter_pcdashboard/widgets/loading_dashboard.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lazy_load_refresh_indicator/lazy_load_refresh_indicator.dart';

class DepartmentScreen extends StatefulWidget {
  @override
  _DepartmentScreenState createState() => _DepartmentScreenState();
}

class _DepartmentScreenState extends State<DepartmentScreen> {
  List<DepartmentResponse> posts;
  int number = 10;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    posts = [];
    number = 10;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DepartmentBloc()..add(FetchListEvent(10)),
      child: BlocListener<DepartmentBloc, DepartmentState>(
        listener: (context, state) {
          if (state is SuccessFetchListState) {
            posts = state.posts;
            number = state.number;
          } else if (state is FailureFetchListState) {
            Toasts.showFailureToast('Tải bảng tin thất bại');
          }
        },
        child: BlocBuilder<DepartmentBloc, DepartmentState>(
            builder: (context, state) {
          return Stack(
            children: <Widget>[
              LazyLoadRefreshIndicator(
                onRefresh: () async {
                  BlocProvider.of<DepartmentBloc>(context)
                      .add(FetchListEvent(10));
                },
                onEndOfPage: () {
                  BlocProvider.of<DepartmentBloc>(context)
                      .add(FetchListEvent(number));
                },
                child: ListView.builder(
                    itemCount: posts.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) => Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 10, 10, 0),
                                child: Text(
                                  posts[index].title,
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.deepOrange,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 5, 10, 0),
                                child: Text(
                                  posts[index].time,
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                child: Text(
                                  posts[index].content,
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black),
                                ),
                              ),
                              posts[index].image != null
                                  ? Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 0, 5, 5),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: CachedNetworkImage(
                                          imageUrl: posts[index].image,
                                          placeholder: (context, url) => Center(
                                              child: SpinKitCircle(
                                            color: Colors.orange,
                                          )),
                                          errorWidget: (context, url, error) =>
                                              Image.asset(
                                                'logo.png',
                                              ),
                                        ),
                                      ),
                                    )
                                  : Container(),
                            ],
                          ),
                        )),
              ),
              state is LoadingState ? LoadingDashboard() : Container()
            ],
          );
        }),
      ),
    );
  }
}
