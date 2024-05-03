// To parse this JSON data, do
//
//     final studentProfermenceArea = studentProfermenceAreaFromJson(jsonString);

import 'dart:convert';

StudentProfermenceArea studentProfermenceAreaFromJson(String str) => StudentProfermenceArea.fromJson(json.decode(str));

String studentProfermenceAreaToJson(StudentProfermenceArea data) => json.encode(data.toJson());

class StudentProfermenceArea {
    int? studentProfileId;
    int? challengeAreaId;
    double? grade;

    StudentProfermenceArea({
        this.studentProfileId,
        this.challengeAreaId,
        this.grade,
    });

    StudentProfermenceArea copyWith({
        int? studentProfileId,
        int? challengeAreaId,
        double? grade,
    }) => 
        StudentProfermenceArea(
            studentProfileId: studentProfileId ?? this.studentProfileId,
            challengeAreaId: challengeAreaId ?? this.challengeAreaId,
            grade: grade ?? this.grade,
        );

    factory StudentProfermenceArea.fromJson(Map<String, dynamic> json) => StudentProfermenceArea(
        studentProfileId: json["student_profile_id"],
        challengeAreaId: json["challenge_area_id"],
        grade: json["grade"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "student_profile_id": studentProfileId,
        "challenge_area_id": challengeAreaId,
        "grade": grade,
    };
}

//-----------------------------------------------------------------------

// To parse this JSON data, do
//
//     final studentProfermenceEvent = studentProfermenceEventFromJson(jsonString);


StudentProfermenceEvent studentProfermenceEventFromJson(String str) => StudentProfermenceEvent.fromJson(json.decode(str));

String studentProfermenceEventToJson(StudentProfermenceEvent data) => json.encode(data.toJson());

class StudentProfermenceEvent {
    int? studentProfileId;
    int? challengeAreaId;
    double? grade;

    StudentProfermenceEvent({
        this.studentProfileId,
        this.challengeAreaId,
        this.grade,
    });

    StudentProfermenceEvent copyWith({
        int? studentProfileId,
        int? challengeAreaId,
        double? grade,
    }) => 
        StudentProfermenceEvent(
            studentProfileId: studentProfileId ?? this.studentProfileId,
            challengeAreaId: challengeAreaId ?? this.challengeAreaId,
            grade: grade ?? this.grade,
        );

    factory StudentProfermenceEvent.fromJson(Map<String, dynamic> json) => StudentProfermenceEvent(
        studentProfileId: json["student_profile_id"],
        challengeAreaId: json["challenge_area_id"],
        grade: json["grade"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "student_profile_id": studentProfileId,
        "challenge_area_id": challengeAreaId,
        "grade": grade,
    };
}
