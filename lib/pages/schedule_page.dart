import 'package:flutter/material.dart';
import 'package:flutter_pcdashboard/models/responses/schedule_response.dart';
import 'package:flutter_pcdashboard/utility/value.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class SchedulePage extends StatefulWidget {
  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  List<ScheduleResponse> schedules = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    schedules.add(ScheduleResponse(day: "THỨ HAI", subjects: [
      Subject(
          time: "08:00-10:00",
          subject: "Lập trình Android",
          teacherOrClass: "Nguyễn Anh Thư"),
      Subject(
          time: "08:00-10:00",
          subject: "Lập trình Android",
          teacherOrClass: "Nguyễn Anh Thư"),
      Subject(
          time: "08:00-10:00",
          subject: "Lập trình Android",
          teacherOrClass: "Nguyễn Anh Thư")
    ]));
    schedules.add(ScheduleResponse(day: "THỨ HAI", subjects: [
      Subject(
          time: "08:00-10:00",
          subject: "Lập trình Android",
          teacherOrClass: "Nguyễn Anh Thư"),
      Subject(
          time: "08:00-10:00",
          subject: "Lập trình Android",
          teacherOrClass: "Nguyễn Anh Thư"),
      Subject(
          time: "08:00-10:00",
          subject: "Lập trình Android",
          teacherOrClass: "Nguyễn Anh Thư")
    ]));
    schedules.add(ScheduleResponse(day: "THỨ HAI", subjects: [
      Subject(
          time: "08:00-10:00",
          subject: "Lập trình Android",
          teacherOrClass: "Nguyễn Anh Thư"),
      Subject(
          time: "08:00-10:00",
          subject: "Lập trình Android",
          teacherOrClass: "Nguyễn Anh Thư"),
      Subject(
          time: "08:00-10:00",
          subject: "Lập trình Android",
          teacherOrClass: "Nguyễn Anh Thư")
    ]));
    schedules.add(ScheduleResponse(day: "THỨ HAI", subjects: [
      Subject(
          time: "08:00-10:00",
          subject: "Lập trình Android",
          teacherOrClass: "Nguyễn Anh Thư"),
      Subject(
          time: "08:00-10:00",
          subject: "Lập trình Android",
          teacherOrClass: "Nguyễn Anh Thư"),
      Subject(
          time: "08:00-10:00",
          subject: "Lập trình Android",
          teacherOrClass: "Nguyễn Anh Thư")
    ]));
    schedules.add(ScheduleResponse(day: "THỨ HAI", subjects: [
      Subject(
          time: "08:00-10:00",
          subject: "Lập trình Android",
          teacherOrClass: "Nguyễn Anh Thư"),
      Subject(
          time: "08:00-10:00",
          subject: "Lập trình Android",
          teacherOrClass: "Nguyễn Anh Thư"),
      Subject(
          time: "08:00-10:00",
          subject: "Lập trình Android",
          teacherOrClass: "Nguyễn Anh Thư")
    ]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        elevation: 0,
        automaticallyImplyLeading: true,
        title: Text(
          Value.SCHEDULE.toUpperCase(),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        gradient: LinearGradient(
            colors: [
              Colors.deepOrange,
              Colors.deepOrangeAccent,
              Colors.orange,
              Colors.orangeAccent,
            ],
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.refresh,
              color: Colors.white,
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.save,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: schedules.length,
          itemBuilder: (context, index) => Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: <Widget>[
                    Text("${schedules[index].day}",style: TextStyle(fontSize: 18,color: Colors.deepOrange,fontWeight: FontWeight.bold),),
                    ListView.builder(
                        itemCount: schedules[index].subjects.length,
                        itemBuilder: (context, index) => Card(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: <Widget>[
                                TextField(
                                  decoration:
                                      InputDecoration(hintText: "Môn học"),
                                ),
                                TextField(
                                  decoration:
                                      InputDecoration(hintText: "Thời gian"),
                                ),
                                TextField(
                                  decoration:
                                      InputDecoration(hintText: "Giảng viên"),
                                )
                              ],
                            )))
                  ],
                ),
              )),
    );
  }
}
