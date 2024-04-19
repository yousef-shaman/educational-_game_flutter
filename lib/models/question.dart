// we will create our question model here
// create a simple class
import 'package:flutter/material.dart';
import 'package:graduation_project_flutter/constants.dart';

class Question {
  final int questionID;
  final int challengeID;
  final Duration timeValue;
  final int totalPoints;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String questionSyntax;
  final String questionAnswer;
  final String type;
  final String difficultyLevel;

  Question({
    required this.questionID,
    required this.challengeID,
    required this.timeValue,
    required this.totalPoints,
    required this.createdAt,
    required this.updatedAt,
    required this.questionSyntax,
    required this.questionAnswer,
    required this.type,
    required this.difficultyLevel,
  });

  Map<String, dynamic> toMap() {
    return {
      'questionID': questionID,
      'challengeID': challengeID,
      'timeValue': timeValue.inMinutes,  // Stored as minutes for simplicity
      'totalPoints': totalPoints,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'questionSyntax': questionSyntax,
      'questionAnswer': questionAnswer,
      'type': type,
      'difficultyLevel': difficultyLevel,
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      questionID: map['questionID'],
      challengeID: map['challengeID'],
      timeValue: Duration(minutes: map['timeValue']),
      totalPoints: map['totalPoints'],
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
      questionSyntax: map['questionSyntax'],
      questionAnswer: map['questionAnswer'],
      type: map['type'],
      difficultyLevel: map['difficultyLevel'],
    );
  }
}


class QuestionWidget extends StatelessWidget {
  const QuestionWidget(
      {super.key,
      required this.question,
      required this.indexAction,
      required this.totalQuestions});
  // here we need the question title and the total number of questions, and also the index

  final String question;
  final int indexAction;
  final int totalQuestions;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        'Question ${indexAction + 1}/$totalQuestions: $question',
        style: const TextStyle(
          fontSize: 24.0,
          color: neutralA,
        ),
      ),
    );
  }
}