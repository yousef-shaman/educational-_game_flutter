// To parse this JSON data, do
//
//     final topicEvent = topicEventFromJson(jsonString);

import 'dart:convert';

TopicEvent topicEventFromJson(String str) => TopicEvent.fromJson(json.decode(str));

String topicEventToJson(TopicEvent data) => json.encode(data.toJson());

class TopicEvent {
    int? eventId;
    int? facultyMemberId;
    String? topicTitle;
    String? source;
    String? description;

    TopicEvent({
        this.eventId,
        this.facultyMemberId,
        this.topicTitle,
        this.source,
        this.description,
    });

    TopicEvent copyWith({
        int? eventId,
        int? facultyMemberId,
        String? topicTitle,
        String? source,
        String? description,
    }) => 
        TopicEvent(
            eventId: eventId ?? this.eventId,
            facultyMemberId: facultyMemberId ?? this.facultyMemberId,
            topicTitle: topicTitle ?? this.topicTitle,
            source: source ?? this.source,
            description: description ?? this.description,
        );

    factory TopicEvent.fromJson(Map<String, dynamic> json) => TopicEvent(
        eventId: json["event_id"],
        facultyMemberId: json["faculty_member_id"],
        topicTitle: json["topic_title"],
        source: json["source"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "event_id": eventId,
        "faculty_member_id": facultyMemberId,
        "topic_title": topicTitle,
        "source": source,
        "description": description,
    };
}
