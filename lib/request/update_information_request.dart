// To parse this JSON data, do
//
//     final updateInformationRequest = updateInformationRequestFromJson(jsonString);

import 'dart:convert';

UpdateInformationRequest updateInformationRequestFromJson(String str) => UpdateInformationRequest.fromJson(json.decode(str));

String updateInformationRequestToJson(UpdateInformationRequest data) => json.encode(data.toJson());

class UpdateInformationRequest {
  String userId;
  String email;
  String phone;

  UpdateInformationRequest({
    this.userId,
    this.email,
    this.phone,
  });

  factory UpdateInformationRequest.fromJson(Map<String, dynamic> json) => UpdateInformationRequest(
    userId: json["userId"] == null ? null : json["userId"],
    email: json["email"] == null ? null : json["email"],
    phone: json["phone"] == null ? null : json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId == null ? null : userId,
    "email": email == null ? null : email,
    "phone": phone == null ? null : phone,
  };
}
