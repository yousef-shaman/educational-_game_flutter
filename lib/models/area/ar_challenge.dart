// To parse this JSON data, do
//
//     final challengeArea = challengeAreaFromJson(jsonString);

import 'dart:convert';

ChallengeArea challengeAreaFromJson(String str) => ChallengeArea.fromJson(json.decode(str));

String challengeAreaToJson(ChallengeArea data) => json.encode(data.toJson());

class ChallengeArea {
    String? difficulty;
    String? description;

    ChallengeArea({
        this.difficulty,
        this.description,
    });

    ChallengeArea copyWith({
        String? difficulty,
        String? description,
    }) => 
        ChallengeArea(
            difficulty: difficulty ?? this.difficulty,
            description: description ?? this.description,
        );

    factory ChallengeArea.fromJson(Map<String, dynamic> json) => ChallengeArea(
        difficulty: json["difficulty"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "difficulty": difficulty,
        "description": description,
    };
}