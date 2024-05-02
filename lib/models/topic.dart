// To parse this JSON data, do
//
//     final topicArea = topicAreaFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:graduation_project_flutter/widgets/custom_glass_card.dart';

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

//---------------------------------------------------------------

// To parse this JSON data, do
//
//     final topicEvent = topicEventFromJson(jsonString);


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

//+++++++++++++++++++++++++++++++++++++++++++++++++++++

class TopicBuilder {

  Widget buildTopicTab(BuildContext context, {Map? dataOfTopics}) {
    
    if (dataOfTopics == null) {
      return const Center(
          child: Text("No data provided.",
              style: TextStyle(
                  color: Color(0xff191923),
                  fontSize: 18,
                  fontWeight: FontWeight.w600)));
    }
    return ListView(
      children: [
        Container(
          margin: const EdgeInsets.all(20),
          child: Text(
            dataOfTopics["title"] ?? "No Title",
            style: const TextStyle(
                color: Color(0xff191923), fontSize: 22, fontWeight: FontWeight.w900),
          ),
        ),
        CustomGlassCard(
          margin: const EdgeInsets.all(15),
          borderRadius: BorderRadius.circular(20),
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                dataOfTopics["body"] ?? "No Content",
                style: const TextStyle(
                    color: Color(0xff191923),
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),)
      ],
    );
  }

  Widget buildExamplesTab(BuildContext context, {Map? dataOfTopics}) {
    
    if (dataOfTopics == null) {
      return const Center(
          child: Text("No data provided.",
              style: TextStyle(
                  color: Color(0xff191923),
                  fontSize: 18,
                  fontWeight: FontWeight.w600)));
    }
    return ListView(
      children: [
        Container(
          margin: const EdgeInsets.all(20),
          child: Text(
            dataOfTopics["title"] ?? "No Title",
            style: const TextStyle(
                color: Color(0xff0e79b2), fontSize: 22, fontWeight: FontWeight.w900),
          ),
        ),
        CustomGlassCard(
          margin: const EdgeInsets.all(15),
          borderRadius: BorderRadius.circular(20),
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                dataOfTopics["body"] ?? "No Content",
                style: const TextStyle(
                    color: Color(0xff0e79b2),
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),)
      ],
    );
  }
}
