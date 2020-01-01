// To parse this JSON data, do
//
//     final userResponse = userResponseFromJson(jsonString);

import 'dart:convert';

List<UserResponse> userResponseFromJson(String str) => List<UserResponse>.from(json.decode(str).map((x) => UserResponse.fromJson(x)));

String userResponseToJson(List<UserResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserResponse {
  String name;
  String userId;
  String email;
  String phone;
  String classId;
  String avatar;
  String role;

  UserResponse({
    this.name,
    this.userId,
    this.email,
    this.phone,
    this.classId,
    this.avatar,
    this.role,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
    name: json["name"] == null ? null : json["name"],
    userId: json["userId"] == null ? null : json["userId"],
    email: json["email"] == null ? null : json["email"],
    phone: json["phone"] == null ? null : json["phone"],
    classId: json["classId"] == null ? null : json["classId"],
    avatar: json["avatar"] == null ? null : json["avatar"],
    role: json["role"] == null ? null : json["role"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "userId": userId == null ? null : userId,
    "email": email == null ? null : email,
    "phone": phone == null ? null : phone,
    "classId": classId == null ? null : classId,
    "avatar": avatar == null ? null : avatar,
    "role": role == null ? null : role,
  };
}
