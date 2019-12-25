import 'package:flutter/material.dart';
import 'package:flutter_pcdashboard/responses/department_response.dart';

class DepartmentPostItem extends StatefulWidget {
  DepartmentResponse deparmentPost;

  DepartmentPostItem(this.deparmentPost);

  @override
  _DepartmentPostItemState createState() => _DepartmentPostItemState();
}

class _DepartmentPostItemState extends State<DepartmentPostItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("${widget.deparmentPost.time}")),
    );
  }
}
