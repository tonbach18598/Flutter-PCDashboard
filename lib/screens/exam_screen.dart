import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pcdashboard/blocs/exam_bloc/exam_bloc.dart';
import 'package:flutter_pcdashboard/blocs/exam_bloc/exam_event.dart';
import 'package:flutter_pcdashboard/blocs/exam_bloc/exam_state.dart';
import 'package:flutter_pcdashboard/models/responses/exam_response.dart';
import 'package:flutter_pcdashboard/utilities/toasts.dart';
import 'package:flutter_pcdashboard/utilities/values.dart';
import 'package:flutter_pcdashboard/widgets/loading_study.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class ExamScreen extends StatefulWidget {
  @override
  _ExamScreenState createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> {
  List<ExamResponse> exams;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    exams = [];
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExamBloc()..add(FetchListEvent()),
      child: BlocListener<ExamBloc, ExamState>(
        listener: (context, state) {
          if (state is SuccessFetchListState) {
            exams = state.exams;
          } else if (state is FailureFetchListState) {
            Toasts.showFailureToast('Tải lịch thi thất bại');
          }
        },
        child: BlocBuilder<ExamBloc, ExamState>(
          builder: (context, state) => Stack(
            children: <Widget>[
              Scaffold(
                  appBar: GradientAppBar(
                    title: Text(
                      Values.EXAM.toUpperCase(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    centerTitle: true,
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
                  body: ListView.builder(
                      itemCount: exams.length,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) => Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 3,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 10, 5, 10),
                                  child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 5),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10),
                                              child: Icon(
                                                Icons.book,
                                                color: Colors.orange,
                                              ),
                                            ),
                                            Text(
                                              '${exams[index].name}',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10),
                                              child: Icon(
                                                Icons.timer,
                                                color: Colors.orange,
                                              ),
                                            ),
                                            Text(
                                              '${exams[index].time}',
                                              style: TextStyle(fontSize: 14),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(5, 10, 10, 10),
                                  child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 5),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10),
                                              child: Icon(
                                                Icons.score,
                                                color: Colors.orange,
                                              ),
                                            ),
                                            Text(
                                              '${exams[index].score}',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10),
                                              child: Icon(
                                                Icons.place,
                                                color: Colors.orange,
                                              ),
                                            ),
                                            Text(
                                              '${exams[index].place}',
                                              style: TextStyle(fontSize: 14),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )))),
              state is LoadingState ? LoadingStudy() : Container()
            ],
          ),
        ),
      ),
    );
  }
}
