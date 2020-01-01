// To parse this JSON data, do
//
//     final chatResponse = chatResponseFromJson(jsonString);

import 'dart:convert';

List<ChatResponse> chatResponseFromJson(String str) => List<ChatResponse>.from(json.decode(str).map((x) => ChatResponse.fromJson(x)));

String chatResponseToJson(List<ChatResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ChatResponse {
  String id;
  String content;
  String time;
  String userName;
  String userAvatar;
  String userId;
  String classId;

  ChatResponse({
    this.id,
    this.content,
    this.time,
    this.userName,
    this.userAvatar,
    this.userId,
    this.classId,
  });

  factory ChatResponse.fromJson(Map<String, dynamic> json) => ChatResponse(
    id: json["id"] == null ? null : json["id"],
    content: json["content"] == null ? null : json["content"],
    time: json["time"] == null ? null : json["time"],
    userName: json["userName"] == null ? null : json["userName"],
    userAvatar: json["userAvatar"] == null ? null : json["userAvatar"],
    userId: json["userId"] == null ? null : json["userId"],
    classId: json["classId"] == null ? null : json["classId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "content": content == null ? null : content,
    "time": time == null ? null : time,
    "userName": userName == null ? null : userName,
    "userAvatar": userAvatar == null ? null : userAvatar,
    "userId": userId == null ? null : userId,
    "classId": classId == null ? null : classId,
  };
}
