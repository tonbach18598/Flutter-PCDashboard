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
  ClassId classId;
  String avatar;
  Role role;

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
    classId: json["classId"] == null ? null : classIdValues.map[json["classId"]],
    avatar: json["avatar"] == null ? null : json["avatar"],
    role: json["role"] == null ? null : roleValues.map[json["role"]],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "userId": userId == null ? null : userId,
    "email": email == null ? null : email,
    "phone": phone == null ? null : phone,
    "classId": classId == null ? null : classIdValues.reverse[classId],
    "avatar": avatar == null ? null : avatar,
    "role": role == null ? null : roleValues.reverse[role],
  };
}

enum ClassId { K16 }

final classIdValues = EnumValues({
  "K16": ClassId.K16
});

enum Role { ROLE_STUDENT, ROLE_ADMIN, ROLE_MONITOR }

final roleValues = EnumValues({
  "ROLE_ADMIN": Role.ROLE_ADMIN,
  "ROLE_MONITOR": Role.ROLE_MONITOR,
  "ROLE_STUDENT": Role.ROLE_STUDENT
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
