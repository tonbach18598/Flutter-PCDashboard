import 'package:flutter/material.dart';
import 'package:flutter_pcdashboard/responses/department_response.dart';
import 'package:flutter_pcdashboard/widgets/department_post_item.dart';

class DepartmentPage extends StatefulWidget {
  @override
  _DepartmentPageState createState() => _DepartmentPageState();
}

class _DepartmentPageState extends State<DepartmentPage> {
  List<DepartmentResponse> posts=[];
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