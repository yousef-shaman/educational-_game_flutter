
// To parse this JSON data, do
//
// final challengeEvent = challengeEventFromJson(jsonString);


import 'dart:convert';

ChallengeEvent challengeEventFromJson(String str) => ChallengeEvent.fromJson(json.decode(str));

String challengeEventToJson(ChallengeEvent data) => json.encode(data.toJson());

class ChallengeEvent {
    String? difficulty;
    String? description;

    ChallengeEvent({
        this.difficulty,
        this.description,
    });

    ChallengeEvent copyWith({
        String? difficulty,
        String? description,
    }) => 
        ChallengeEvent(
            difficulty: difficulty ?? this.difficulty,
            description: description ?? this.description,
        );

    factory ChallengeEvent.fromJson(Map<String, dynamic> json) => ChallengeEvent(
        difficulty: json["difficulty"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "difficulty": difficulty,
        "description": description,
    };
}