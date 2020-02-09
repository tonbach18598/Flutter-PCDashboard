import 'package:flutter/material.dart';
import 'package:flutter_pcdashboard/utilities/preferences.dart';
import 'package:flutter_pcdashboard/utilities/routes.dart';
import 'package:flutter_pcdashboard/utilities/values.dart';

class ContactScreen extends StatefulWidget {
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
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
                        Radius.circular(MediaQuery.of(context).size.height / 8.8),
                    bottomRight: Radius.circular(
                        MediaQuery.of(context).size.height / 8.8)),
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
                  child: Center(
                      child: Text(
                    Values.CHAT.toUpperCase(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  )),
                ),
                onTap: () async {
                  Navigator.of(context).pushNamed(Routes.chatRoute,
                      arguments: (await Preferences.loadSelf()).userId);
                },
              ),
            ),
          SizedBox(height: 5,),
          Expanded(
            flex: 1,
            child: InkWell(
                borderRadius: BorderRadius.only(
                    topRight:
                        Radius.circular(MediaQuery.of(context).size.height / 8.8),
                    bottomLeft: Radius.circular(
                        MediaQuery.of(context).size.height / 8.8)),
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
                  child: Center(
                      child: Text(
                    Values.STUDENT_LIST.toUpperCase(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  )),
                ),
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(Routes.userRoute, arguments: 'SV');
                },
              ),
            ),
          SizedBox(height: 5,),
          Expanded(
            flex: 1,
            child: InkWell(
                borderRadius: BorderRadius.only(
                    topLeft:
                        Radius.circular(MediaQuery.of(context).size.height / 8.8),
                    bottomRight: Radius.circular(
                        MediaQuery.of(context).size.height / 8.8)),
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
                  child: Center(
                      child: Text(
                    Values.TEACHER_LIST.toUpperCase(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  )),
                ),
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(Routes.userRoute, arguments: 'GV');
                },
              ),
            ),
        ],
      ),
    );
  }
}
