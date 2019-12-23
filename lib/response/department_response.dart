// To parse this JSON data, do
//
//     final departmentResponse = departmentResponseFromJson(jsonString);

import 'dart:convert';

List<DepartmentResponse> departmentResponseFromJson(String str) => List<DepartmentResponse>.from(json.decode(str).map((x) => DepartmentResponse.fromJson(x)));

String departmentResponseToJson(List<DepartmentResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DepartmentResponse {
  String id;
  String title;
  String content;
  String image;
  String time;

  DepartmentResponse({
    this.id,
    this.title,
    this.content,
    this.image,
    this.time,
  });

  factory DepartmentResponse.fromJson(Map<String, dynamic> json) => DepartmentResponse(
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    content: json["content"] == null ? null : json["content"],
    image: json["image"] == null ? null : json["image"],
    time: json["time"] == null ? null : json["time"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "content": content == null ? null : content,
    "image": image == null ? null : image,
    "time": time == null ? null : time,
  };
}
