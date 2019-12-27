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
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.grey[100],
              child: Row(
                children: <Widget>[
                  Expanded(
                      flex: 2,
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width / 7,
                          height: MediaQuery.of(context).size.width / 7,
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: CircleAvatar(),
                          ))),
                  Expanded(
                    flex: 4,
                    child: Container(
                      height: MediaQuery.of(context).size.height / 22,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white),
                      child: Center(child: Text("Chia sẻ suy nghĩ của bạn...",style: TextStyle(fontSize: 16),)),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width / 8,
                          height: MediaQuery.of(context).size.width / 8))
                ],
              ),
            ),
          ),
          Expanded(
            flex: 9,
            child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) => ClassPostItem(posts[index])),
          ),
        ],
      ),
    );
  }
}
