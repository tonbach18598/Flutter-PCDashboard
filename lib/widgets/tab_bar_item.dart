import 'package:flutter/material.dart';

class DashboardTabBarItem extends StatelessWidget {
  String title;
  IconData icon;

  DashboardTabBarItem(this.title, this.icon);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5,bottom: 5),
      child: Tab(
        child: Column(
          children: <Widget>[
            Icon(icon),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(title,style: TextStyle(fontSize: 12),),
            )
          ],
        ),
      ),
    );
  }
}

