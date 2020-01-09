// To parse this JSON data, do
//
//     final examResponse = examResponseFromJson(jsonString);

import 'dart:convert';

List<ExamResponse> examResponseFromJson(String str) => List<ExamResponse>.from(json.decode(str).map((x) => ExamResponse.fromJson(x)));

String examResponseToJson(List<ExamResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ExamResponse {
  String name;
  String time;
  String place;
  double score;
  String userId;

  ExamResponse({
    this.name,
    this.time,
    this.place,
    this.score,
    this.userId,
  });

  factory ExamResponse.fromJson(Map<String, dynamic> json) => ExamResponse(
    name: json["name"] == null ? null : json["name"],
    time: json["time"] == null ? null : json["time"],
    place: json["place"] == null ? null : json["place"],
    score: json["score"] == null ? null : json["score"],
    userId: json["userId"] == null ? null : json["userId"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "time": time == null ? null : time,
    "place": place == null ? null : place,
    "score": score == null ? null : score,
    "userId": userId == null ? null : userId,
  };
}
