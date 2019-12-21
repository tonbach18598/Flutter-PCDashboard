import 'package:flutter/material.dart';

class DashboardDrawerItem extends StatelessWidget {
  String _title;
  IconData _icon;

  DashboardDrawerItem(this._title, this._icon);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(_icon,color: Colors.orange,),
      title: Text(_title,style: TextStyle(fontSize: 16),),
      onTap: () {
        // Update the state of the app.
        // ...
      },
    );
  }
}
