// To parse this JSON data, do
//
//     final paragraphEvent = paragraphEventFromJson(jsonString);

import 'dart:convert';

ParagraphEvent paragraphEventFromJson(String str) => ParagraphEvent.fromJson(json.decode(str));

String paragraphEventToJson(ParagraphEvent data) => json.encode(data.toJson());

class ParagraphEvent {
    int? topicEventId;
    String? paragraphTitle;
    String? content;
    String? example;

    ParagraphEvent({
        this.topicEventId,
        this.paragraphTitle,
        this.content,
        this.example,
    });

    ParagraphEvent copyWith({
        int? topicEventId,
        String? paragraphTitle,
        String? content,
        String? example,
    }) => 
        ParagraphEvent(
            topicEventId: topicEventId ?? this.topicEventId,
            paragraphTitle: paragraphTitle ?? this.paragraphTitle,
            content: content ?? this.content,
            example: example ?? this.example,
        );

    factory ParagraphEvent.fromJson(Map<String, dynamic> json) => ParagraphEvent(
        topicEventId: json["topic_event_id"],
        paragraphTitle: json["paragraph_title"],
        content: json["content"],
        example: json["example"],
    );

    Map<String, dynamic> toJson() => {
        "topic_event_id": topicEventId,
        "paragraph_title": paragraphTitle,
        "content": content,
        "example": example,
    };
}
