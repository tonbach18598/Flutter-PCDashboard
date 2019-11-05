import 'package:flutter/material.dart';

class DashboardTabBar extends StatefulWidget {
  String _title;
  IconData _iconData;

  DashboardTabBar(this._title, this._iconData);

  @override
  _DashboardTabBarState createState() => _DashboardTabBarState(_title,_iconData);
}

class _DashboardTabBarState extends State<DashboardTabBar> {
  String _title;
  IconData _iconData;

  _DashboardTabBarState(this._title, this._iconData);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5,bottom: 5),
      child: Tab(
        child: Column(
          children: <Widget>[
            Icon(_iconData),
            Text(_title)
          ],
        ),
      ),
    );
  }
}
