// To parse this JSON data, do
//
//     final questionArea = questionAreaFromJson(jsonString);

import 'dart:convert';

QuestionArea questionAreaFromJson(String str) => QuestionArea.fromJson(json.decode(str));

String questionAreaToJson(QuestionArea data) => json.encode(data.toJson());

class QuestionArea {
    String? questionTitle;
    int? totalPoints;
    double? timeValue;
    String? description;

    QuestionArea({
        this.questionTitle,
        this.totalPoints,
        this.timeValue,
        this.description,
    });

    QuestionArea copyWith({
        String? questionTitle,
        int? totalPoints,
        double? timeValue,
        String? description,
    }) => 
        QuestionArea(
            questionTitle: questionTitle ?? this.questionTitle,
            totalPoints: totalPoints ?? this.totalPoints,
            timeValue: timeValue ?? this.timeValue,
            description: description ?? this.description,
        );

    factory QuestionArea.fromJson(Map<String, dynamic> json) => QuestionArea(
        questionTitle: json["question_title"],
        totalPoints: json["total_points"]?.toDouble(),
        timeValue: json["time_value"]?.toDouble(),
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "question_title": questionTitle,
        "total_points": totalPoints,
        "time_value": timeValue,
        "description": description,
    };
}
