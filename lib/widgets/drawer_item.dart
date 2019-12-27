import 'package:flutter/material.dart';

class DashboardDrawerItem extends StatelessWidget {
  String title;
  IconData icon;
  VoidCallback onClick;

  DashboardDrawerItem({@required this.title, @required this.icon, @required this.onClick});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon,color: Colors.orange,),
      title: Text(title,style: TextStyle(fontSize: 14),),
      onTap: () {
        onClick();
      },
    );
  }
}
