// To parse this JSON data, do
//
//     final questionEvent = questionEventFromJson(jsonString);

import 'dart:convert';

QuestionEvent questionEventFromJson(String str) => QuestionEvent.fromJson(json.decode(str));

String questionEventToJson(QuestionEvent data) => json.encode(data.toJson());

class QuestionEvent {
    int? challengeEventId;
    String? questionTitle;
    double? totalPoints;
    double? timeValue;
    String? description;

    QuestionEvent({
        this.challengeEventId,
        this.questionTitle,
        this.totalPoints,
        this.timeValue,
        this.description,
    });

    QuestionEvent copyWith({
        int? challengeEventId,
        String? questionTitle,
        double? totalPoints,
        double? timeValue,
        String? description,
    }) => 
        QuestionEvent(
            challengeEventId: challengeEventId ?? this.challengeEventId,
            questionTitle: questionTitle ?? this.questionTitle,
            totalPoints: totalPoints ?? this.totalPoints,
            timeValue: timeValue ?? this.timeValue,
            description: description ?? this.description,
        );

    factory QuestionEvent.fromJson(Map<String, dynamic> json) => QuestionEvent(
        challengeEventId: json["challenge_event_id"],
        questionTitle: json["question_title"],
        totalPoints: json["total_points"]?.toDouble(),
        timeValue: json["time_value"]?.toDouble(),
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "challenge_event_id": challengeEventId,
        "question_title": questionTitle,
        "total_points": totalPoints,
        "time_value": timeValue,
        "description": description,
    };
}
