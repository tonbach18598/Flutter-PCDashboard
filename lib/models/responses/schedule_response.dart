// To parse this JSON data, do
//
//     final scheduleResponse = scheduleResponseFromJson(jsonString);

import 'dart:convert';

List<ScheduleResponse> scheduleResponseFromJson(String str) => List<ScheduleResponse>.from(json.decode(str).map((x) => ScheduleResponse.fromJson(x)));

String scheduleResponseToJson(List<ScheduleResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ScheduleResponse {
  String day;
  List<Subject> subjects;

  ScheduleResponse({
    this.day,
    this.subjects,
  });

  factory ScheduleResponse.fromJson(Map<String, dynamic> json) => ScheduleResponse(
    day: json["day"] == null ? null : json["day"],
    subjects: json["subjects"] == null ? null : List<Subject>.from(json["subjects"].map((x) => Subject.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "day": day == null ? null : day,
    "subjects": subjects == null ? null : List<dynamic>.from(subjects.map((x) => x.toJson())),
  };
}

class Subject {
  String id;
  String time;
  String subject;
  String teacherOrClass;
  String day;
  String classId;
  dynamic teacherId;

  Subject({
    this.id,
    this.time,
    this.subject,
    this.teacherOrClass,
    this.day,
    this.classId,
    this.teacherId,
  });

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
    id: json["id"] == null ? null : json["id"],
    time: json["time"] == null ? null : json["time"],
    subject: json["subject"] == null ? null : json["subject"],
    teacherOrClass: json["teacherOrClass"] == null ? null : json["teacherOrClass"],
    day: json["day"] == null ? null : json["day"],
    classId: json["classId"] == null ? null : json["classId"],
    teacherId: json["teacherId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "time": time == null ? null : time,
    "subject": subject == null ? null : subject,
    "teacherOrClass": teacherOrClass == null ? null : teacherOrClass,
    "day": day == null ? null : day,
    "classId": classId == null ? null : classId,
    "teacherId": teacherId,
  };
}
