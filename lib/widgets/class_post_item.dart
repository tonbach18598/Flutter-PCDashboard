import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pcdashboard/models/responses/class_response.dart';

class ClassPostItem extends StatefulWidget {
  ClassResponse classPost;

  ClassPostItem(this.classPost);

  @override
  _ClassPostItemState createState() => _ClassPostItemState();
}

class _ClassPostItemState extends State<ClassPostItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Row(
              children: <Widget>[
                SizedBox(
                    width: MediaQuery.of(context).size.width / 5,
                    height: MediaQuery.of(context).size.width / 5,
                    child: CircleAvatar(
                      child: Image.network(widget.classPost.userAvatar),
                    )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.classPost.userName,
                      style:
                      TextStyle(fontSize: 18, color: Colors.orange),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        widget.classPost.time,
                        style:
                        TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Text(
              widget.classPost.content,
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: CachedNetworkImage(
                  imageUrl: widget.classPost.image,
                  placeholder: (context, url) => Center(child: CircularProgressIndicator(backgroundColor: Colors.orange,)),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding:
                        const EdgeInsets.only(left: 10, right: 5),
                        child: Icon(Icons.favorite),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.only(left: 5, right: 10),
                        child: Text(
                          "Thích",
                          style: TextStyle(fontSize: 16),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding:
                        const EdgeInsets.only(left: 10, right: 5),
                        child: Icon(Icons.comment),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.only(left: 5, right: 10),
                        child: Text(
                          "Bình luận",
                          style: TextStyle(fontSize: 16),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}