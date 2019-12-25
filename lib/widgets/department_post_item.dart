import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pcdashboard/models/responses/department_response.dart';

class DepartmentPostItem extends StatefulWidget {
  DepartmentResponse deparmentPost;

  DepartmentPostItem(this.deparmentPost);

  @override
  _DepartmentPostItemState createState() => _DepartmentPostItemState();
}

class _DepartmentPostItemState extends State<DepartmentPostItem> {
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
            child: Text(
              widget.deparmentPost.title,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.orange,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Text(
              widget.deparmentPost.content,
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: CachedNetworkImage(
                  imageUrl: widget.deparmentPost.image,
                  placeholder: (context, url) => Center(child: CircularProgressIndicator(backgroundColor: Colors.orange,)),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),),
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
