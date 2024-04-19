import 'package:flutter/material.dart';
import 'package:graduation_project_flutter/widgets/custom_glass_card.dart';


class Challenge {
  final int challengeID;
  final int topicID;
  final int numberOfQuestions;
  final int maxPoints;
  final DateTime startDate;
  final DateTime? endDate;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String challengeName;
  final String difficulty;
  final String? description;

  Challenge({
    required this.challengeID,
    required this.topicID,
    required this.numberOfQuestions,
    required this.maxPoints,
    required this.startDate,
    this.endDate,
    required this.createdAt,
    required this.updatedAt,
    required this.challengeName,
    required this.difficulty,
    this.description,
  });

  Map<String, dynamic> toMap() {
    var map = {
      'challengeID': challengeID,
      'topicID': topicID,
      'numberOfQuestions': numberOfQuestions,
      'maxPoints': maxPoints,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate?.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'challengeName': challengeName,
      'difficulty': difficulty,
      'description': description,
    };

    return map;
  }

  factory Challenge.fromMap(Map<String, dynamic> map) {
    return Challenge(
      challengeID: map['challengeID'],
      topicID: map['topicID'],
      numberOfQuestions: map['numberOfQuestions'],
      maxPoints: map['maxPoints'],
      startDate: DateTime.parse(map['startDate']),
      endDate: map['endDate'] != null ? DateTime.parse(map['endDate']) : null,
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
      challengeName: map['challengeName'],
      difficulty: map['difficulty'],
      description: map['description'],
    );
  }
}



class ChallingesBuilder {

  Widget buildEasyChallinge(BuildContext context, {Map? dataOfTopics}) {
    
    if (dataOfTopics == null) {
      return const Center(
          child: Text("No data provided.",
              style: TextStyle(
                  color: Color(0xff191923),
                  fontSize: 18,
                  fontWeight: FontWeight.w600)));
    }
    return InkWell(
      onTap: () {
        
      },
      child: CustomGlassCard(
            margin: const EdgeInsets.all(15),
            height: 150,
            width: 150,
            borderRadius: BorderRadius.circular(400),
            content: const Center(
              child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Icon(Icons.hive, color: Colors.greenAccent, size: 100,)
                  
                  // Text(
                  //   dataOfTopics["title"] ?? "No Title",
                  //   style: const TextStyle(
                  //       color: Color(0xff191923),
                  //       fontSize: 18,
                  //       fontWeight: FontWeight.w600),
                  // ),
                ),
            ),),
    );
  } 


  Widget buildMediumChallinge(BuildContext context, {Map? dataOfTopics}) {
    
    if (dataOfTopics == null) {
      return const Center(
          child: Text("No data provided.",
              style: TextStyle(
                  color: Color(0xff191923),
                  fontSize: 18,
                  fontWeight: FontWeight.w600)));
    }
    return InkWell(
      onTap: () {
        
      },
      child: CustomGlassCard(
            margin: const EdgeInsets.all(15),
            height: 150,
            width: 150,
            borderRadius: BorderRadius.circular(400),
            content: const Center(
              child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Icon(Icons.mode_standby_outlined, color: Colors.orangeAccent, size: 100,)
                  
                  // Text(
                  //   dataOfTopics["title"] ?? "No Title",
                  //   style: const TextStyle(
                  //       color: Color(0xff191923),
                  //       fontSize: 18,
                  //       fontWeight: FontWeight.w600),
                  // ),
                ),
            ),),
    );
  }

  Widget buildHardChallinge(BuildContext context, {Map? dataOfTopics}) {
    
    if (dataOfTopics == null) {
      return const Center(
          child: Text("No data provided.",
              style: TextStyle(
                  color: Color(0xff191923),
                  fontSize: 18,
                  fontWeight: FontWeight.w600)));
    }
    return InkWell(
      onTap: () {
        
      },
      child: CustomGlassCard(
            margin: const EdgeInsets.all(15),
            height: 150,
            width: 150,
            borderRadius: BorderRadius.circular(400),
            content: const Center(
              child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Icon(Icons.local_fire_department, color: Colors.redAccent, size: 100,)
                  
                  // Text(
                  //   dataOfTopics["title"] ?? "No Title",
                  //   style: const TextStyle(
                  //       color: Color(0xff191923),
                  //       fontSize: 18,
                  //       fontWeight: FontWeight.w600),
                  // ),
                ),
            ),),
    );
  }
}