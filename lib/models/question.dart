// To parse this JSON data, do
//
//     final questionArea = questionAreaFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';

QuestionArea questionAreaFromJson(String str) => QuestionArea.fromJson(json.decode(str));

String questionAreaToJson(QuestionArea data) => json.encode(data.toJson());

class QuestionArea {
    String? questionTitle;
    int? totalPoints;
    double? timeValue;
    String? description;

    QuestionArea({
        this.questionTitle,
        this.totalPoints,
        this.timeValue,
        this.description,
    });

    QuestionArea copyWith({
        String? questionTitle,
        int? totalPoints,
        double? timeValue,
        String? description,
    }) => 
        QuestionArea(
            questionTitle: questionTitle ?? this.questionTitle,
            totalPoints: totalPoints ?? this.totalPoints,
            timeValue: timeValue ?? this.timeValue,
            description: description ?? this.description,
        );

    factory QuestionArea.fromJson(Map<String, dynamic> json) => QuestionArea(
        questionTitle: json["question_title"],
        totalPoints: json["total_points"]?.toDouble(),
        timeValue: json["time_value"]?.toDouble(),
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "question_title": questionTitle,
        "total_points": totalPoints,
        "time_value": timeValue,
        "description": description,
    };
}

//------------------------------------------------------------

// To parse this JSON data, do
//
//     final questionEvent = questionEventFromJson(jsonString);


QuestionEvent questionEventFromJson(String str) => QuestionEvent.fromJson(json.decode(str));

String questionEventToJson(QuestionEvent data) => json.encode(data.toJson());

class QuestionEvent {
    String? questionTitle;
    double? totalPoints;
    double? timeValue;
    String? description;

    QuestionEvent({
        this.questionTitle,
        this.totalPoints,
        this.timeValue,
        this.description,
    });

    QuestionEvent copyWith({
        String? questionTitle,
        double? totalPoints,
        double? timeValue,
        String? description,
    }) => 
        QuestionEvent(
            questionTitle: questionTitle ?? this.questionTitle,
            totalPoints: totalPoints ?? this.totalPoints,
            timeValue: timeValue ?? this.timeValue,
            description: description ?? this.description,
        );

    factory QuestionEvent.fromJson(Map<String, dynamic> json) => QuestionEvent(
        questionTitle: json["question_title"],
        totalPoints: json["total_points"]?.toDouble(),
        timeValue: json["time_value"]?.toDouble(),
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "question_title": questionTitle,
        "total_points": totalPoints,
        "time_value": timeValue,
        "description": description,
    };
}

//+++++++++++++++++++++++++++++++++++++++++++

class QuestionWidget extends StatelessWidget {
  /// Creates a widget that displays a question with its index and the total number of questions.
  /// 
  /// Requires the question text, the index of the current question, and the total number of questions.
  const QuestionWidget({
    super.key,
    required this.question,  // The text of the question to display
    required this.indexAction,  // The index of the current question (0-based index)
    required this.totalQuestions  // The total number of questions
  });

  // Properties to hold the data passed to the widget
  final String question;
  final int indexAction;
  final int totalQuestions;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10.0),  // Adds padding around the text
          child: Text(
            // Displays the question number in a formatted string
            '${indexAction + 1} : $totalQuestions',
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,  // Makes the text bold
              color: Colors.black,  // Changed from 'neutralA' for clarity; replace with actual color if needed
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(5.0),  // Adds padding around the text
          child: Text(
            // Displays the question text
            question,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,  // Makes the text bold
              color: Colors.black,  // Changed from 'neutralA' for clarity; replace with actual color if needed
            ),
          ),
        ),
      ],
    );
  }
}
enum DifficultyLevel {
  low,
  medium,
  high
}

enum Type {
  multipleChoice,
  text,
}