import 'package:flutter/material.dart';
import 'package:flutter_pcdashboard/utilities/routes.dart';
import 'package:flutter_pcdashboard/utilities/values.dart';

class StudyScreen extends StatefulWidget {
  @override
  _StudyScreenState createState() => _StudyScreenState();
}

class _StudyScreenState extends State<StudyScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: InkWell(
                borderRadius: BorderRadius.only(
                    topLeft:
                        Radius.circular(MediaQuery.of(context).size.height / 4.4),
                    topRight: Radius.circular(
                        MediaQuery.of(context).size.height / 4.4)),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                            MediaQuery.of(context).size.height / 4),
                        topRight: Radius.circular(
                            MediaQuery.of(context).size.height / 4)),
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
                  child: Center(
                      child: Text(
                    Values.SCHEDULE.toUpperCase(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  )),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(Routes.scheduleRoute);
                },
              ),
            ),
          SizedBox(height: 5,),
          Expanded(
            flex: 1,
            child: InkWell(
                borderRadius: BorderRadius.only(
                    bottomLeft:
                        Radius.circular(MediaQuery.of(context).size.height / 4.4),
                    bottomRight: Radius.circular(
                        MediaQuery.of(context).size.height / 4.4)),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(
                            MediaQuery.of(context).size.height / 4),
                        bottomRight: Radius.circular(
                            MediaQuery.of(context).size.height / 4)),
                    gradient: LinearGradient(
                        colors: [
                          Colors.blueAccent,
                          Colors.blue,
                          Colors.lightBlue,
                          Colors.lightBlueAccent,
                        ],
                        begin: FractionalOffset.topCenter,
                        end: FractionalOffset.bottomCenter),
                  ),
                  child: Center(
                      child: Text(
                    Values.EXAM.toUpperCase(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  )),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(Routes.examRoute);
                },
              ),
            ),
        ],
      ),
    );
  }
}
