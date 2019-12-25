// To parse this JSON data, do
//
//     final changePasswordRequest = changePasswordRequestFromJson(jsonString);

import 'dart:convert';

ChangePasswordRequest changePasswordRequestFromJson(String str) => ChangePasswordRequest.fromJson(json.decode(str));

String changePasswordRequestToJson(ChangePasswordRequest data) => json.encode(data.toJson());

class ChangePasswordRequest {
  String userId;
  String oldPassword;
  String newPassword;

  ChangePasswordRequest({
    this.userId,
    this.oldPassword,
    this.newPassword,
  });

  factory ChangePasswordRequest.fromJson(Map<String, dynamic> json) => ChangePasswordRequest(
    userId: json["userId"] == null ? null : json["userId"],
    oldPassword: json["oldPassword"] == null ? null : json["oldPassword"],
    newPassword: json["newPassword"] == null ? null : json["newPassword"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId == null ? null : userId,
    "oldPassword": oldPassword == null ? null : oldPassword,
    "newPassword": newPassword == null ? null : newPassword,
  };
}
