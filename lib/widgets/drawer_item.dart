import 'package:flutter/material.dart';

class DashboardDrawerItem extends StatelessWidget {
  String title;
  IconData icon;

  DashboardDrawerItem(this.title, this.icon);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon,color: Colors.orange,),
      title: Text(title,style: TextStyle(fontSize: 16),),
      onTap: () {
        // Update the state of the app.
        // ...
      },
    );
  }
}
