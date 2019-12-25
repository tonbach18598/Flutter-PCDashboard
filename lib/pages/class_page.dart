import 'package:flutter/material.dart';
import 'package:flutter_pcdashboard/responses/class_response.dart';
import 'package:flutter_pcdashboard/widgets/class_post_item.dart';

class ClassPage extends StatefulWidget {
  @override
  _ClassPageState createState() => _ClassPageState();
}

class _ClassPageState extends State<ClassPage> {
  List<ClassResponse> posts=[];
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
