import 'package:flutter/material.dart';
import 'package:flutter_pcdashboard/models/responses/class_response.dart';
import 'package:flutter_pcdashboard/widgets/class_post_item.dart';

class ClassPage extends StatefulWidget {
  @override
  _ClassPageState createState() => _ClassPageState();
}

class _ClassPageState extends State<ClassPage> {
  List<ClassResponse> posts = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    posts.add(ClassResponse(
        userName: "Bùi Ngô Tôn Bách",
        userAvatar:
            "https://thuthuatnhanh.com/wp-content/uploads/2019/10/anh-avatar-soai-ca-superman.jpg",
        time: "10:00 30/11/2020",
        content: "Thông báo nhắc nhở nộp bài",
        image:
            "https://sites.google.com/site/hinhanhdep24h/_/rsrc/1436687439788/home/hinh%20anh%20thien%20nhien%20dep%202015%20%281%29.jpeg"));
    posts.add(ClassResponse(
        userName: "Bùi Ngô Tôn Bách",
        userAvatar:
            "https://thuthuatnhanh.com/wp-content/uploads/2019/10/anh-avatar-soai-ca-superman.jpg",
        time: "10:00 30/11/2020",
        content: "Thông báo nhắc nhở nộp bài",
        image:
            "https://sites.google.com/site/hinhanhdep24h/_/rsrc/1436687439788/home/hinh%20anh%20thien%20nhien%20dep%202015%20%281%29.jpeg"));
    posts.add(ClassResponse(
        userName: "Bùi Ngô Tôn Bách",
        userAvatar:
            "https://thuthuatnhanh.com/wp-content/uploads/2019/10/anh-avatar-soai-ca-superman.jpg",
        time: "10:00 30/11/2020",
        content: "Thông báo nhắc nhở nộp bài",
        image:
            "https://sites.google.com/site/hinhanhdep24h/_/rsrc/1436687439788/home/hinh%20anh%20thien%20nhien%20dep%202015%20%281%29.jpeg"));
    posts.add(ClassResponse(
        userName: "Bùi Ngô Tôn Bách",
        userAvatar:
            "https://thuthuatnhanh.com/wp-content/uploads/2019/10/anh-avatar-soai-ca-superman.jpg",
        time: "10:00 30/11/2020",
        content: "Thông báo nhắc nhở nộp bài",
        image:
            "https://sites.google.com/site/hinhanhdep24h/_/rsrc/1436687439788/home/hinh%20anh%20thien%20nhien%20dep%202015%20%281%29.jpeg"));
    posts.add(ClassResponse(
        userName: "Bùi Ngô Tôn Bách",
        userAvatar:
            "https://thuthuatnhanh.com/wp-content/uploads/2019/10/anh-avatar-soai-ca-superman.jpg",
        time: "10:00 30/11/2020",
        content: "Thông báo nhắc nhở nộp bài",
        image:
            "https://sites.google.com/site/hinhanhdep24h/_/rsrc/1436687439788/home/hinh%20anh%20thien%20nhien%20dep%202015%20%281%29.jpeg"));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) => ClassPostItem(posts[index]));
  }
}
