import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pcdashboard/models/responses/exam_response.dart';
import 'package:flutter_pcdashboard/utilities/value.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class ExamPage extends StatefulWidget {
  @override
  _ExamPageState createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  List<ExamResponse> exams = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    exams.add(ExamResponse(
        score: 10,
        name: "Cảm biến và Đo lường",
        time: "12:30 10/12/2019",
        place: "E304"));
    exams.add(ExamResponse(
        score: 10,
        name: "Cảm biến và Đo lường",
        time: "12:30 10/12/2019",
        place: "E304"));
    exams.add(ExamResponse(
        score: 10,
        name: "Cảm biến và Đo lường",
        time: "12:30 10/12/2019",
        place: "E304"));
    exams.add(ExamResponse(
        score: 10,
        name: "Cảm biến và Đo lường",
        time: "12:30 10/12/2019",
        place: "E304"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GradientAppBar(
          title: Text(Value.EXAM.toUpperCase(),style: TextStyle(fontWeight: FontWeight.bold),),
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
            itemBuilder: (context, index) => Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10,10,5,10),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Icon(Icons.book,color: Colors.orange,),
                                  ),
                                  Text("${exams[index].name}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Icon(Icons.timer,color: Colors.orange,),
                                  ),
                                  Text("${exams[index].time}",style: TextStyle(fontSize: 14),)
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
                        padding: const EdgeInsets.fromLTRB(5,10,10,10),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Icon(Icons.score,color: Colors.orange,),
                                  ),
                                  Text("${exams[index].score}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Icon(Icons.place,color: Colors.orange,),
                                  ),
                                  Text("${exams[index].place}",style: TextStyle(fontSize: 14),)
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ))));
  }
}
