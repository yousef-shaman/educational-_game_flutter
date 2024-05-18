// To parse this JSON data, do
//
//     final questionArea = questionAreaFromJson(jsonString);

import 'dart:convert';

PostQuestionArea questionAreaFromJson(String str) => PostQuestionArea.fromJson(json.decode(str));

String questionAreaToJson(PostQuestionArea data) => json.encode(data.toJson());

class PostQuestionArea {
    int? challengeAreaId;
    String? questionTitle;
    double? totalPoints;
    double? timeValue;
    String? description;

    PostQuestionArea({
        this.challengeAreaId,
        this.questionTitle,
        this.totalPoints,
        this.timeValue,
        this.description,
    });

    PostQuestionArea copyWith({
        int? challengeAreaId,
        String? questionTitle,
        double? totalPoints,
        double? timeValue,
        String? description,
    }) => 
        PostQuestionArea(
            challengeAreaId: challengeAreaId ?? this.challengeAreaId,
            questionTitle: questionTitle ?? this.questionTitle,
            totalPoints: totalPoints ?? this.totalPoints,
            timeValue: timeValue ?? this.timeValue,
            description: description ?? this.description,
        );

    factory PostQuestionArea.fromJson(Map<String, dynamic> json) => PostQuestionArea(
        challengeAreaId: json["challenge_area_id"],
        questionTitle: json["question_title"],
        totalPoints: json["total_points"]?.toDouble(),
        timeValue: json["time_value"]?.toDouble(),
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "challenge_area_id": challengeAreaId,
        "question_title": questionTitle,
        "total_points": totalPoints,
        "time_value": timeValue,
        "description": description,
    };
}

// To parse this JSON data, do
//
//     final getQuestionArea = getQuestionAreaFromJson(jsonString);

List<GetQuestionArea> getQuestionAreaFromJson(String str) => List<GetQuestionArea>.from(json.decode(str).map((x) => GetQuestionArea.fromJson(x)));

String getQuestionAreaToJson(List<GetQuestionArea> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetQuestionArea {
    int? id;
    int? challengeAreaId;
    String? questionTitle;
    double? totalPoints;
    double? timeValue;
    String? description;
    DateTime? dateCreated;
    DateTime? dateUbdated;

    GetQuestionArea({
        this.id,
        this.challengeAreaId,
        this.questionTitle,
        this.totalPoints,
        this.timeValue,
        this.description,
        this.dateCreated,
        this.dateUbdated,
    });

    GetQuestionArea copyWith({
        int? id,
        int? challengeAreaId,
        String? questionTitle,
        double? totalPoints,
        double? timeValue,
        String? description,
        DateTime? dateCreated,
        DateTime? dateUbdated,
    }) => 
        GetQuestionArea(
            id: id ?? this.id,
            challengeAreaId: challengeAreaId ?? this.challengeAreaId,
            questionTitle: questionTitle ?? this.questionTitle,
            totalPoints: totalPoints ?? this.totalPoints,
            timeValue: timeValue ?? this.timeValue,
            description: description ?? this.description,
            dateCreated: dateCreated ?? this.dateCreated,
            dateUbdated: dateUbdated ?? this.dateUbdated,
        );

    factory GetQuestionArea.fromJson(Map<String, dynamic> json) => GetQuestionArea(
        id: json["id"],
        challengeAreaId: json["challenge_area_id"],
        questionTitle: json["question_title"],
        totalPoints: json["total_points"]?.toDouble(),
        timeValue: json["time_value"]?.toDouble(),
        description: json["description"],
        dateCreated: json["date_created"] == null ? null : DateTime.parse(json["date_created"]),
        dateUbdated: json["date_ubdated"] == null ? null : DateTime.parse(json["date_ubdated"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "challenge_area_id": challengeAreaId,
        "question_title": questionTitle,
        "total_points": totalPoints,
        "time_value": timeValue,
        "description": description,
        "date_created": "${dateCreated!.year.toString().padLeft(4, '0')}-${dateCreated!.month.toString().padLeft(2, '0')}-${dateCreated!.day.toString().padLeft(2, '0')}",
        "date_ubdated": "${dateUbdated!.year.toString().padLeft(4, '0')}-${dateUbdated!.month.toString().padLeft(2, '0')}-${dateUbdated!.day.toString().padLeft(2, '0')}",
    };
}

