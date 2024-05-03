// To parse this JSON data, do
//
//     final topicArea = topicAreaFromJson(jsonString);

import 'dart:convert';

TopicArea topicAreaFromJson(String str) => TopicArea.fromJson(json.decode(str));

String topicAreaToJson(TopicArea data) => json.encode(data.toJson());

class TopicArea {
    String? topicTitle;
    String? source;
    String? description;

    TopicArea({
        this.topicTitle,
        this.source,
        this.description,
    });

    TopicArea copyWith({
        String? topicTitle,
        String? source,
        String? description,
    }) => 
        TopicArea(
            topicTitle: topicTitle ?? this.topicTitle,
            source: source ?? this.source,
            description: description ?? this.description,
        );

    factory TopicArea.fromJson(Map<String, dynamic> json) => TopicArea(
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

