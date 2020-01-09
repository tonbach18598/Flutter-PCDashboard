import 'package:flutter/material.dart';
import 'package:flutter_pcdashboard/utilities/routes.dart';
import 'package:flutter_pcdashboard/utilities/values.dart';

class StudyPage extends StatefulWidget {
  @override
  _StudyPageState createState() => _StudyPageState();
}

class _StudyPageState extends State<StudyPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
            child: InkWell(
              borderRadius: BorderRadius.only(
                  topLeft:
                  Radius.circular(MediaQuery.of(context).size.height / 4.4),
                  topRight:
                  Radius.circular(MediaQuery.of(context).size.height / 4.4)),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft:
                      Radius.circular(MediaQuery.of(context).size.height / 4),
                      topRight:
                      Radius.circular(MediaQuery.of(context).size.height / 4)),
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
                child: Center(child: Text(Values.SCHEDULE.toUpperCase(),style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),)),
              ),
              onTap: () {
                Navigator.of(context).pushNamed(Routes.scheduleRoute);
              },
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: InkWell(
              borderRadius: BorderRadius.only(
                  bottomLeft:
                  Radius.circular(MediaQuery.of(context).size.height / 4.4),
                  bottomRight:
                  Radius.circular(MediaQuery.of(context).size.height / 4.4)),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft:
                      Radius.circular(MediaQuery.of(context).size.height / 4),
                      bottomRight:
                      Radius.circular(MediaQuery.of(context).size.height / 4)),                  gradient: LinearGradient(
                      colors: [
                        Colors.blueAccent,
                        Colors.blue,
                        Colors.lightBlue,
                        Colors.lightBlueAccent,
                      ],
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter),
                ),
                child: Center(child: Text(Values.EXAM.toUpperCase(),style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),)),
              ),
              onTap: () {
                Navigator.of(context).pushNamed(Routes.examRoute);
              },
            ),
          ),
        ),
      ],
    );
  }
}
