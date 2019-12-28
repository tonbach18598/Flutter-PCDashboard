import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pcdashboard/models/responses/department_response.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
        itemBuilder: (context, index) => Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Text(
                  posts[index].title,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10,5,10,0),
                child: Text(
                  posts[index].time,
                  style:
                  TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                child: Text(
                  posts[index].content,
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: posts[index].image,
                    placeholder: (context, url) => Center(child: SpinKitCircle(color: Colors.orange,)),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),),
              ),
            ],
          ),
        ));
  }
}
