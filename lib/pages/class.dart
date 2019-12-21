import 'package:flutter/material.dart';

class ClassPage extends StatefulWidget {
  @override
  _ClassPageState createState() => _ClassPageState();
}

class _ClassPageState extends State<ClassPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple,
      child: RaisedButton(
        child: Text("Change Theme"),
        onPressed: (){
        },
      ),
    );
  }
}
