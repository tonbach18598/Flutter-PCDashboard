import 'package:flutter/material.dart';
import 'package:flutter_pcdashboard/models/responses/department_response.dart';
import 'package:flutter_pcdashboard/widgets/department_post_item.dart';

class DepartmentPage extends StatefulWidget {
  @override
  _DepartmentPageState createState() => _DepartmentPageState();
}

class _DepartmentPageState extends State<DepartmentPage> {
  List<DepartmentResponse> posts = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    posts.add(DepartmentResponse(
        title: "Chào mừng 20/11",
        time: "17:20 20/11/2019",
        content: "Bộ môn VLTH tổ chức lễ kỉ niệm ngày ngà giáo VN",
        image:
            "https://sites.google.com/site/hinhanhdep24h/_/rsrc/1436687439788/home/hinh%20anh%20thien%20nhien%20dep%202015%20%281%29.jpeg"));
    posts.add(DepartmentResponse(
        title: "Chào mừng 20/11",
        time: "17:20 20/11/2019",
        content: "Bộ môn VLTH tổ chức lễ kỉ niệm ngày ngà giáo VN",
        image:
            "https://sites.google.com/site/hinhanhdep24h/_/rsrc/1436687439788/home/hinh%20anh%20thien%20nhien%20dep%202015%20%281%29.jpeg"));
    posts.add(DepartmentResponse(
        title: "Chào mừng 20/11",
        time: "17:20 20/11/2019",
        content: "Bộ môn VLTH tổ chức lễ kỉ niệm ngày ngà giáo VN",
        image:
            "https://sites.google.com/site/hinhanhdep24h/_/rsrc/1436687439788/home/hinh%20anh%20thien%20nhien%20dep%202015%20%281%29.jpeg"));
    posts.add(DepartmentResponse(
        title: "Chào mừng 20/11",
        time: "17:20 20/11/2019",
        content: "Bộ môn VLTH tổ chức lễ kỉ niệm ngày ngà giáo VN",
        image:
            "https://sites.google.com/site/hinhanhdep24h/_/rsrc/1436687439788/home/hinh%20anh%20thien%20nhien%20dep%202015%20%281%29.jpeg"));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) => DepartmentPostItem(posts[index]));
  }
}
