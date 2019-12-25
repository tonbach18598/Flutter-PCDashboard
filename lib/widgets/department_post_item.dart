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
      elevation: 5,
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
                  color: Colors.deepOrangeAccent,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10,5,10,0),
            child: Text(
              widget.deparmentPost.time,
              style:
              TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
            child: Text(
              widget.deparmentPost.content,
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: CachedNetworkImage(
                  imageUrl: widget.deparmentPost.image,
                  placeholder: (context, url) => Center(child: CircularProgressIndicator(backgroundColor: Colors.orange,)),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),),
          ),
        ],
      ),
    );
  }
}
