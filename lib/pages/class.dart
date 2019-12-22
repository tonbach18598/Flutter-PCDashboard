import 'package:flutter/material.dart';
import 'package:flutter_pcdashboard/model/class_post.dart';
import 'package:flutter_pcdashboard/widgets/class_post_item.dart';

class ClassPage extends StatefulWidget {
  @override
  _ClassPageState createState() => _ClassPageState();
}

class _ClassPageState extends State<ClassPage> {
  List<ClassPost> posts=[];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context,index)=>ClassPostItem(posts[index]),
      ),
    );
  }
}
