import 'package:flutter/material.dart';
import 'package:graduation_project_flutter/widgets/custom_glass_card.dart';

class Topic {
  final int topicID;
  final int? areaID;
  final int? eventID;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String topicTitle;
  final String topicContent;
  final String examples;
  final String sources;

  Topic({
    required this.topicID,
    this.areaID,
    this.eventID,
    required this.createdAt,
    required this.updatedAt,
    required this.topicTitle,
    required this.topicContent,
    required this.examples,
    required this.sources,
  });

  Map<String, dynamic> toMap() {
    var map = {
      'topicID': topicID,
      'areaID': areaID,
      'eventID': eventID,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'topicTitle': topicTitle,
      'topicContent': topicContent,
      'examples': examples,
      'sources': sources,
    };

    return map;
  }

  factory Topic.fromMap(Map<String, dynamic> map) {
    return Topic(
      topicID: map['topicID'],
      areaID: map['areaID'],
      eventID: map['eventID'],
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
      topicTitle: map['topicTitle'],
      topicContent: map['topicContent'],
      examples: map['examples'],
      sources: map['sources'],
    );
  }
}



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
          content: Padding(
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
          content: Padding(
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


