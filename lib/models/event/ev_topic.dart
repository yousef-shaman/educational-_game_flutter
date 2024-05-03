
// To parse this JSON data, do
//
// final topicEvent = topicEventFromJson(jsonString);


import 'dart:convert';

TopicEvent topicEventFromJson(String str) => TopicEvent.fromJson(json.decode(str));

String topicEventToJson(TopicEvent data) => json.encode(data.toJson());

class TopicEvent {
    String? topicTitle;
    String? source;
    String? description;

    TopicEvent({
        this.topicTitle,
        this.source,
        this.description,
    });

    TopicEvent copyWith({
        String? topicTitle,
        String? source,
        String? description,
    }) => 
        TopicEvent(
            topicTitle: topicTitle ?? this.topicTitle,
            source: source ?? this.source,
            description: description ?? this.description,
        );

    factory TopicEvent.fromJson(Map<String, dynamic> json) => TopicEvent(
        topicTitle: json["topic_title"],
        source: json["source"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "topic_title": topicTitle,
        "source": source,
        "description": description,
    };
}