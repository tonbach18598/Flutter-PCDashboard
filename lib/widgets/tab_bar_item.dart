import 'package:flutter/material.dart';

class DashboardTabBarItem extends StatelessWidget {
  String _title;
  IconData _icon;

  DashboardTabBarItem(this._title, this._icon);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5,bottom: 5),
      child: Tab(
        child: Column(
          children: <Widget>[
            Icon(_icon),
            Text(_title)
          ],
        ),
      ),
    );
  }
}

