// To parse this JSON data, do
//
//     final commentResponse = commentResponseFromJson(jsonString);

import 'dart:convert';

List<CommentResponse> commentResponseFromJson(String str) => List<CommentResponse>.from(json.decode(str).map((x) => CommentResponse.fromJson(x)));

String commentResponseToJson(List<CommentResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CommentResponse {
  String id;
  String content;
  String time;
  String userId;
  String userAvatar;
  String userName;

  CommentResponse({
    this.id,
    this.content,
    this.time,
    this.userId,
    this.userAvatar,
    this.userName,
  });

  factory CommentResponse.fromJson(Map<String, dynamic> json) => CommentResponse(
    id: json["id"] == null ? null : json["id"],
    content: json["content"] == null ? null : json["content"],
    time: json["time"] == null ? null : json["time"],
    userId: json["userId"] == null ? null : json["userId"],
    userAvatar: json["userAvatar"] == null ? null : json["userAvatar"],
    userName: json["userName"] == null ? null : json["userName"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "content": content == null ? null : content,
    "time": time == null ? null : time,
    "userId": userId == null ? null : userId,
    "userAvatar": userAvatar == null ? null : userAvatar,
    "userName": userName == null ? null : userName,
  };
}
