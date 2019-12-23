// To parse this JSON data, do
//
//     final signinResponse = signinResponseFromJson(jsonString);

import 'dart:convert';

SigninResponse signinResponseFromJson(String str) => SigninResponse.fromJson(json.decode(str));

String signinResponseToJson(SigninResponse data) => json.encode(data.toJson());

class SigninResponse {
  String tokenType;
  String accessToken;

  SigninResponse({
    this.tokenType,
    this.accessToken,
  });

  factory SigninResponse.fromJson(Map<String, dynamic> json) => SigninResponse(
    tokenType: json["tokenType"] == null ? null : json["tokenType"],
    accessToken: json["accessToken"] == null ? null : json["accessToken"],
  );

  Map<String, dynamic> toJson() => {
    "tokenType": tokenType == null ? null : tokenType,
    "accessToken": accessToken == null ? null : accessToken,
  };
}
