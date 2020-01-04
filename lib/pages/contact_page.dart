import 'package:flutter/material.dart';
import 'package:flutter_pcdashboard/utilities/router.dart';
import 'package:flutter_pcdashboard/utilities/value.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
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
                      Radius.circular(MediaQuery.of(context).size.height / 4),
                  bottomRight:
                      Radius.circular(MediaQuery.of(context).size.height / 4)),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.deepOrange,
                        Colors.deepOrangeAccent,
                        Colors.orange,
                        Colors.orangeAccent,
                      ],
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                          MediaQuery.of(context).size.height / 8),
                      bottomRight: Radius.circular(
                          MediaQuery.of(context).size.height / 8)),
                ),
                child: Center(child: Text(Value.CHAT.toUpperCase(),style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),)),
              ),
              onTap: () {
                Navigator.of(context).pushNamed(Router.chatRoute);
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
                  topRight:
                      Radius.circular(MediaQuery.of(context).size.height / 4),
                  bottomLeft:
                      Radius.circular(MediaQuery.of(context).size.height / 4)),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.green,
                        Colors.lightGreen,
                        Colors.lightGreenAccent,
                        Colors.greenAccent,
                      ],
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(
                          MediaQuery.of(context).size.height / 8),
                      bottomLeft: Radius.circular(
                          MediaQuery.of(context).size.height / 8)),
                ),
                child: Center(child: Text(Value.STUDENT_LIST.toUpperCase(),style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),)),
              ),
              onTap: () {
                Navigator.of(context)
                    .pushNamed(Router.userRoute, arguments: 'SV');
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
                  topLeft:
                      Radius.circular(MediaQuery.of(context).size.height / 4),
                  bottomRight:
                      Radius.circular(MediaQuery.of(context).size.height / 4)),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.blueAccent,
                        Colors.blue,
                        Colors.lightBlue,
                        Colors.lightBlueAccent,
                      ],
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                          MediaQuery.of(context).size.height / 8),
                      bottomRight: Radius.circular(
                          MediaQuery.of(context).size.height / 8)),
                ),
                child: Center(child: Text(Value.TEACHER_LIST.toUpperCase(),style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),)),
              ),
              onTap: () {
                Navigator.of(context)
                    .pushNamed(Router.userRoute, arguments: 'GV');
              },
            ),
          ),
        ),
      ],
    );
  }
}
