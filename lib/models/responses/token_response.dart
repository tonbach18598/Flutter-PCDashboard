// To parse this JSON data, do
//
//     final signinResponse = signinResponseFromJson(jsonString);

import 'dart:convert';

TokenResponse tokenResponseFromJson(String str) => TokenResponse.fromJson(json.decode(str));

String tokenResponseToJson(TokenResponse data) => json.encode(data.toJson());

class TokenResponse {
  String tokenType;
  String accessToken;

  TokenResponse({
    this.tokenType,
    this.accessToken,
  });

  factory TokenResponse.fromJson(Map<String, dynamic> json) => TokenResponse(
    tokenType: json["tokenType"] == null ? null : json["tokenType"],
    accessToken: json["accessToken"] == null ? null : json["accessToken"],
  );

  Map<String, dynamic> toJson() => {
    "tokenType": tokenType == null ? null : tokenType,
    "accessToken": accessToken == null ? null : accessToken,
  };
}
