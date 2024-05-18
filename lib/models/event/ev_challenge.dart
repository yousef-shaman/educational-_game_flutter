// To parse this JSON data, do
//
//     final challengeEvent = challengeEventFromJson(jsonString);

import 'dart:convert';

ChallengeEvent challengeEventFromJson(String str) => ChallengeEvent.fromJson(json.decode(str));

String challengeEventToJson(ChallengeEvent data) => json.encode(data.toJson());

class ChallengeEvent {
    int? topicEventId;
    String? difficulty;
    String? description;

    ChallengeEvent({
        this.topicEventId,
        this.difficulty,
        this.description,
    });

    ChallengeEvent copyWith({
        int? topicEventId,
        String? difficulty,
        String? description,
    }) => 
        ChallengeEvent(
            topicEventId: topicEventId ?? this.topicEventId,
            difficulty: difficulty ?? this.difficulty,
            description: description ?? this.description,
        );

    factory ChallengeEvent.fromJson(Map<String, dynamic> json) => ChallengeEvent(
        topicEventId: json["topic_event_id"],
        difficulty: json["difficulty"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "topic_event_id": topicEventId,
        "difficulty": difficulty,
        "description": description,
    };
}
