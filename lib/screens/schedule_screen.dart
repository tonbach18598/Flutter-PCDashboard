import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pcdashboard/blocs/schedule_bloc/schedule_bloc.dart';
import 'package:flutter_pcdashboard/blocs/schedule_bloc/schedule_event.dart';
import 'package:flutter_pcdashboard/blocs/schedule_bloc/schedule_state.dart';
import 'package:flutter_pcdashboard/models/responses/schedule_response.dart';
import 'package:flutter_pcdashboard/utilities/toasts.dart';
import 'package:flutter_pcdashboard/utilities/values.dart';
import 'package:flutter_pcdashboard/widgets/loading_study.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class ScheduleScreen extends StatefulWidget {
  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  List<ScheduleResponse> schedules;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    schedules = [];
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ScheduleBloc()..add(FetchListEvent()),
      child: BlocListener<ScheduleBloc, ScheduleState>(
        listener: (context, state) {
          if (state is SuccessFetchListState) {
            schedules = state.schedules;
          } else if (state is FailureFetchListState) {
            Toasts.showFailureToast('Tải thời khoá biểu thất bại');
          }
        },
        child: BlocBuilder<ScheduleBloc, ScheduleState>(
          builder: (context, state) => Stack(
            children: <Widget>[
              Scaffold(
                appBar: GradientAppBar(
                  elevation: 0,
                  automaticallyImplyLeading: true,
                  title: Text(
                    Values.SCHEDULE.toUpperCase(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  centerTitle: true,
                  gradient: LinearGradient(
                      colors: [
                        Colors.deepOrange,
                        Colors.deepOrangeAccent,
                        Colors.orange,
                        Colors.orangeAccent,
                      ],
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter),
//                  actions: <Widget>[
//                    IconButton(
//                      icon: Icon(
//                        Icons.refresh,
//                        color: Colors.white,
//                      ),
//                    ),
//                    IconButton(
//                      icon: Icon(
//                        Icons.save,
//                        color: Colors.white,
//                      ),
//                    ),
//                  ],
                ),
                body: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: schedules.length,
                      itemBuilder: (context, schedulesIndex) => Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Container(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                    child: Text(
                                      '${schedules[schedulesIndex].day.toUpperCase()}',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.deepOrange,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  ListView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: schedules[schedulesIndex]
                                          .subjects
                                          .length,
                                      itemBuilder: (context, subjectsIndex) =>
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                5, 0, 5, 5),
                                            child: Card(
                                                color: Colors.white,
                                                elevation: 5,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: <Widget>[
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                5, 5, 10, 5),
                                                        child: Row(
                                                          children: <Widget>[
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      right:
                                                                          10),
                                                              child: Icon(
                                                                Icons.book,
                                                                color: Colors
                                                                    .orange,
                                                              ),
                                                            ),
                                                            Text(
                                                              '${schedules[schedulesIndex].subjects[subjectsIndex].subject}',
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                5, 5, 10, 5),
                                                        child: Row(
                                                          children: <Widget>[
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      right:
                                                                          10),
                                                              child: Icon(
                                                                Icons.timer,
                                                                color: Colors
                                                                    .orange,
                                                              ),
                                                            ),
                                                            Text(
                                                              '${schedules[schedulesIndex].subjects[subjectsIndex].time}',
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  color: Colors
                                                                      .black),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                5, 5, 10, 5),
                                                        child: Row(
                                                          children: <Widget>[
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      right:
                                                                          10),
                                                              child: Icon(
                                                                Icons.person,
                                                                color: Colors
                                                                    .orange,
                                                              ),
                                                            ),
                                                            Text(
                                                                '${schedules[schedulesIndex].subjects[subjectsIndex].teacherOrClass}',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    color: Colors
                                                                        .black))
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )),
                                          )),
                                ],
                              ),
                            ),
                          )),
                ),
              ),
              state is LoadingState ? LoadingStudy() : Container()
            ],
          ),
        ),
      ),
    );
  }
}
