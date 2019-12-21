import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: <Widget>[
          Container(color: Colors.green,
          height: MediaQuery.of(context).size.height/5,),
          Expanded(
            child: OptionListView(),
          )
        ],
      ),
    );
  }
  Widget OptionListView()=>ListView(
    children: <Widget>[
      ListTile(
        title: Text("Học tập"),
      ),ListTile(
        title: Text("Học tập"),
      ),
      ListTile(
        title: Text("Học tập"),
      ),
      ListTile(
        title: Text("Học tập"),
      ),ListTile(
        title: Text("Học tập"),
      ),ListTile(
        title: Text("Học tập"),
      ),
      ListTile(
        title: Text("Học tập"),
      ),
      ListTile(
        title: Text("Học tập"),
      ),ListTile(
        title: Text("Học tập"),
      ),ListTile(
        title: Text("Học tập"),
      ),
      ListTile(
        title: Text("Học tập"),
      ),
      ListTile(
        title: Text("Học tập"),
      )
    ],
  );
}
