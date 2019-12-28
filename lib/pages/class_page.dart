import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pcdashboard/models/responses/class_response.dart';
import 'package:flutter_pcdashboard/utility/router.dart';
import 'package:flutter_pcdashboard/utility/value.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
            child: GestureDetector(
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
              onTap: (){Navigator.of(context).pushNamed(Router.postRoute);},
            ),
          ),
          Expanded(
            flex: 9,
            child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) => Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                                width: MediaQuery.of(context).size.width / 6,
                                height: MediaQuery.of(context).size.width / 6,
                                child: CircleAvatar(
                                  child: Image.network(posts[index].userAvatar),
                                )),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    posts[index].userName,
                                    style: TextStyle(fontSize: 16, color: Colors.deepOrange,fontWeight: FontWeight.bold),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      posts[index].time,
                                      style: TextStyle(fontSize: 12, color: Colors.grey),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
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
                              placeholder: (context, url) => Center(
                                  child: SpinKitCircle(
                                    color: Colors.orange,
                                  )),
                              errorWidget: (context, url, error) => Icon(Icons.error,color: Colors.orange,),
                            )),
                      ),
                      GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10,bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: Icon(Icons.comment,color: Colors.orange,),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text(
                                  Value.COMMENT,
                                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                        onTap: (){Navigator.of(context).pushNamed(Router.commentRoute);},
                      )
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
