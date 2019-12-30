import 'package:flutter/material.dart';
import 'package:flutter_pcdashboard/utility/router.dart';

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
            padding: const EdgeInsets.fromLTRB(10,10,10,5),
            child: InkWell(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.red
                ),
              ),
              onTap: (){Navigator.of(context).pushNamed(Router.scheduleRoute);},
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10,5,10,5),
            child: InkWell(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.green
                ),
              ),
              onTap: (){Navigator.of(context).pushNamed(Router.examRoute);},
            ),
          ),
        ),
      ],
    );
  }
}
