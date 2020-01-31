import 'package:flutter/material.dart';

class CustomDrawerItem extends StatelessWidget {
  String title;
  IconData icon;
  VoidCallback onTap;

  CustomDrawerItem({@required this.title, @required this.icon, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon,color: Colors.orange,),
      title: Text(title,style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
      onTap: () {
        onTap();
      },
    );
  }
}
