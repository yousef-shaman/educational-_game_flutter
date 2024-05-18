// To parse this JSON data, do
//
//     final studentProfermenceArea = studentProfermenceAreaFromJson(jsonString);

import 'dart:convert';

StudentProfermenceArea studentProfermenceAreaFromJson(String str) => StudentProfermenceArea.fromJson(json.decode(str));

String studentProfermenceAreaToJson(StudentProfermenceArea data) => json.encode(data.toJson());

class StudentProfermenceArea {
    int? studentProfileId;
    int? challengeAreaId;
    int? grade;
    bool? isCompleted;

    StudentProfermenceArea({
        this.studentProfileId,
        this.challengeAreaId,
        this.grade,
        this.isCompleted,
    });

    StudentProfermenceArea copyWith({
        int? studentProfileId,
        int? challengeAreaId,
        int? grade,
        bool? isCompleted,
    }) => 
        StudentProfermenceArea(
            studentProfileId: studentProfileId ?? this.studentProfileId,
            challengeAreaId: challengeAreaId ?? this.challengeAreaId,
            grade: grade ?? this.grade,
            isCompleted: isCompleted ?? this.isCompleted,
        );

    factory StudentProfermenceArea.fromJson(Map<String, dynamic> json) => StudentProfermenceArea(
        studentProfileId: json["student_profile_id"],
        challengeAreaId: json["challenge_area_id"],
        grade: json["grade"]?.toInt(),
        isCompleted: json["is_completed"],
    );

    Map<String, dynamic> toJson() => {
        "student_profile_id": studentProfileId,
        "challenge_area_id": challengeAreaId,
        "grade": grade,
        "is_completed": isCompleted,
    };
}

// To parse this JSON data, do
//
//     final getStudentProfermenceArea = getStudentProfermenceAreaFromJson(jsonString);


List<GetStudentProfermenceArea> getStudentProfermenceAreaFromJson(String str) => List<GetStudentProfermenceArea>.from(json.decode(str).map((x) => GetStudentProfermenceArea.fromJson(x)));

String getStudentProfermenceAreaToJson(List<GetStudentProfermenceArea> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetStudentProfermenceArea {
    int? id;
    int? studentProfileId;
    int? challengeAreaId;
    double? grade;
    bool? isCompleted;

    GetStudentProfermenceArea({
        this.id,
        this.studentProfileId,
        this.challengeAreaId,
        this.grade,
        this.isCompleted,
    });

    GetStudentProfermenceArea copyWith({
        int? id,
        int? studentProfileId,
        int? challengeAreaId,
        double? grade,
        bool? isCompleted,
    }) => 
        GetStudentProfermenceArea(
            id: id ?? this.id,
            studentProfileId: studentProfileId ?? this.studentProfileId,
            challengeAreaId: challengeAreaId ?? this.challengeAreaId,
            grade: grade ?? this.grade,
            isCompleted: isCompleted ?? this.isCompleted,
        );

    factory GetStudentProfermenceArea.fromJson(Map<String, dynamic> json) => GetStudentProfermenceArea(
        id: json["id"],
        studentProfileId: json["student_profile_id"],
        challengeAreaId: json["challenge_area_id"],
        grade: json["grade"]?.toDouble(),
        isCompleted: json["is_completed"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "student_profile_id": studentProfileId,
        "challenge_area_id": challengeAreaId,
        "grade": grade,
        "is_completed": isCompleted,
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
