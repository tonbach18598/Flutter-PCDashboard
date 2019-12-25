// To parse this JSON data, do
//
//     final selfResponse = selfResponseFromJson(jsonString);

import 'dart:convert';

SelfResponse selfResponseFromJson(String str) => SelfResponse.fromJson(json.decode(str));

String selfResponseToJson(SelfResponse data) => json.encode(data.toJson());

class SelfResponse {
  String name;
  String userId;
  String email;
  String phone;
  String classId;
  String avatar;
  String role;

  SelfResponse({
    this.name,
    this.userId,
    this.email,
    this.phone,
    this.classId,
    this.avatar,
    this.role,
  });

  factory SelfResponse.fromJson(Map<String, dynamic> json) => SelfResponse(
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
