// To parse this JSON data, do
//
//     final classResponse = classResponseFromJson(jsonString);

import 'dart:convert';

List<ClassResponse> classResponseFromJson(String str) => List<ClassResponse>.from(json.decode(str).map((x) => ClassResponse.fromJson(x)));

String classResponseToJson(List<ClassResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ClassResponse {
  String id;
  String content;
  String image;
  String time;
  String userId;
  String userAvatar;
  String userName;
  String userRole;

  ClassResponse({
    this.id,
    this.content,
    this.image,
    this.time,
    this.userId,
    this.userAvatar,
    this.userName,
    this.userRole,
  });

  factory ClassResponse.fromJson(Map<String, dynamic> json) => ClassResponse(
    id: json["id"] == null ? null : json["id"],
    content: json["content"] == null ? null : json["content"],
    image: json["image"] == null ? null : json["image"],
    time: json["time"] == null ? null : json["time"],
    userId: json["userId"] == null ? null : json["userId"],
    userAvatar: json["userAvatar"] == null ? null : json["userAvatar"],
    userName: json["userName"] == null ? null : json["userName"],
    userRole: json["userRole"] == null ? null : json["userRole"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "content": content == null ? null : content,
    "image": image == null ? null : image,
    "time": time == null ? null : time,
    "userId": userId == null ? null : userId,
    "userAvatar": userAvatar == null ? null : userAvatar,
    "userName": userName == null ? null : userName,
    "userRole": userRole == null ? null : userRole,
  };
}
