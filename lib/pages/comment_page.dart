import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_pcdashboard/models/responses/comment_response.dart';
import 'package:flutter_pcdashboard/utility/value.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class CommentPage extends StatefulWidget {
  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  List<CommentResponse> comments = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    comments.add(CommentResponse(userName:"Bùi Ngô Tôn Bách", content:"Ứng dụng tuyệt vời, ủng hộ", time:"17:30 20/11/2019",userAvatar:
    "https://thuthuatnhanh.com/wp-content/uploads/2019/10/anh-avatar-soai-ca-superman.jpg"));
    comments.add(CommentResponse(userName:"Bùi Ngô Tôn Bách", content:"Ứng dụng tuyệt vời, ủng hộ", time:"17:30 20/11/2019",userAvatar:
    "https://thuthuatnhanh.com/wp-content/uploads/2019/10/anh-avatar-soai-ca-superman.jpg"));
    comments.add(CommentResponse(userName:"Bùi Ngô Tôn Bách", content:"Ứng dụng tuyệt vời, ủng hộ", time:"17:30 20/11/2019",userAvatar:
    "https://thuthuatnhanh.com/wp-content/uploads/2019/10/anh-avatar-soai-ca-superman.jpg"));
    comments.add(CommentResponse(userName:"Bùi Ngô Tôn Bách", content:"Ứng dụng tuyệt vời, ủng hộ", time:"17:30 20/11/2019",userAvatar:
    "https://thuthuatnhanh.com/wp-content/uploads/2019/10/anh-avatar-soai-ca-superman.jpg"));
    comments.add(CommentResponse(userName:"Bùi Ngô Tôn Bách", content:"Ứng dụng tuyệt vời, ủng hộ", time:"17:30 20/11/2019",userAvatar:
    "https://thuthuatnhanh.com/wp-content/uploads/2019/10/anh-avatar-soai-ca-superman.jpg"));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        elevation: 0,
        automaticallyImplyLeading: true,
        gradient: LinearGradient(
            colors: [
              Colors.deepOrange,
              Colors.deepOrangeAccent,
              Colors.orange,
              Colors.orangeAccent,
            ],
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
            children: <Widget>[
              ListView.builder(
                  itemCount: comments.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: SizedBox(
                              width: 50,
                              height: 50,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: CircleAvatar(
                                  child: Image.network(comments[index].userAvatar),
                                ),
                              )),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.grey[300]
                              ),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(15,10,15,10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("${comments[index].userName}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.deepOrange),),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text("${comments[index].content}",style: TextStyle(fontSize: 14),),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5,left: 15),
                              child: Text("${comments[index].time}",style: TextStyle(fontSize: 12,color: Colors.grey),),
                            )
                          ],
                        )
                      ],
                    ),
                  )),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Colors.deepOrange,
                            Colors.deepOrangeAccent,
                            Colors.orange,
                            Colors.orangeAccent,
                          ],
                          begin: FractionalOffset.bottomCenter,
                          end: FractionalOffset.topCenter)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        flex: 5,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20,10,0,10),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: TextField(
                                keyboardType: TextInputType.multiline,
                                maxLines: 3,
                                minLines: 1,
                                style: TextStyle(
                                    fontSize: 16
                                ),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Nhập nội dung...",
                                    hintStyle: TextStyle(
                                        fontSize: 16
                                    )
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: IconButton(icon: Icon(Icons.send,size: 30,color: Colors.white,)),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
      ),
    );
  }
  Future<void> showActionSheet() async {
    return showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: Text(Value.OPTION,style: TextStyle(color: Colors.blueAccent),),
          actions: <Widget>[
            CupertinoActionSheetAction(
              child: Text(
                Value.EDIT_COMMENT,
                style: TextStyle(color: Colors.orange),
              ),
              onPressed: () {
                /** */
              },
            ),
            CupertinoActionSheetAction(
              child: Text(Value.DELETE_COMMENT, style: TextStyle(color: Colors.orange)),
              onPressed: () {
                /** */
              },
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            isDefaultAction: true,
            child:
            Text(Value.CANCEL, style: TextStyle(color: Colors.deepOrange)),
            onPressed: () {
              /** */
            },
          ),
        );
      },
    );
  }
}
