import 'package:flutter/material.dart';
import 'package:flutter_pcdashboard/model/department_post.dart';
import 'package:flutter_pcdashboard/widgets/department_post_item.dart';

class DepartmentPage extends StatefulWidget {
  @override
  _DepartmentPageState createState() => _DepartmentPageState();
}

class _DepartmentPageState extends State<DepartmentPage> {
  List<DeparmentPost> posts=[new DeparmentPost("Bui ngo ton bach"),new DeparmentPost("Bui ngo ton bach 2")];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context,index)=> DepartmentPostItem(posts[index])
      ),
    );
  }
}