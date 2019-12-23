// To parse this JSON data, do
//
//     final signinRequest = signinRequestFromJson(jsonString);

import 'dart:convert';

SigninRequest signinRequestFromJson(String str) => SigninRequest.fromJson(json.decode(str));

String signinRequestToJson(SigninRequest data) => json.encode(data.toJson());

class SigninRequest {
  String userId;
  String password;

  SigninRequest({
    this.userId,
    this.password,
  });

  factory SigninRequest.fromJson(Map<String, dynamic> json) => SigninRequest(
    userId: json["userId"] == null ? null : json["userId"],
    password: json["password"] == null ? null : json["password"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId == null ? null : userId,
    "password": password == null ? null : password,
  };
}
