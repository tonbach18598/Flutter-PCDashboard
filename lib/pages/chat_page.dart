import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_pcdashboard/blocs/class_bloc/class_state.dart';
import 'package:flutter_pcdashboard/models/responses/comment_response.dart';
import 'package:flutter_pcdashboard/utilities/value.dart';
import 'package:flutter_pcdashboard/widgets/loading_comment.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<CommentResponse> comments = [];
  TextEditingController textEditingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textEditingController=TextEditingController();
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
        title: Text(
          Value.CHAT.toUpperCase(),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
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
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                      itemCount: comments.length,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) => Padding(
                          padding:
                          const EdgeInsets.fromLTRB(10,5,10,5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    0, 10, 10, 0),
                                child: SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: CachedNetworkImage(
                                    imageUrl:
                                    comments[index].userAvatar,
                                    imageBuilder:
                                        (context, imageProvider) =>
                                        Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                    placeholder: (context, url) =>
                                        Center(
                                            child: SpinKitDualRing(
                                              color: Colors.orange,
                                            )),
                                    errorWidget:
                                        (context, url, error) => Icon(
                                      Icons.error,
                                      color: Colors.orange,
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(15),
                                        color: Colors.grey[300]),
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.fromLTRB(
                                          15, 10, 15, 10),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            '${comments[index].userName}',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight:
                                                FontWeight.bold,
                                                color:
                                                Colors.deepOrange),
                                          ),
                                          Padding(
                                            padding:
                                            const EdgeInsets.only(
                                                top: 5),
                                            child: Text(
                                              '${comments[index].content}',
                                              style: TextStyle(
                                                  fontSize: 14),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5, left: 15),
                                    child: Text(
                                      '${comments[index].time}',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                ),
                Container(
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
                          padding:
                          const EdgeInsets.fromLTRB(20, 10, 0, 10),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: TextField(
                                controller: textEditingController,
                                cursorColor: Colors.lightBlue,
                                keyboardType: TextInputType.multiline,
                                maxLines: 3,
                                minLines: 1,
                                style: TextStyle(fontSize: 16),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: Value.ENTER_CONTENT,
                                    hintStyle: TextStyle(fontSize: 16)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: IconButton(
                          icon: Icon(
                            Icons.send,
                            size: 30,
                            color: Colors.white,
                          ),
                          onPressed: () {
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
