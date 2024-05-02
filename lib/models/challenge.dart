// To parse this JSON data, do
//
//     final challengeArea = challengeAreaFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:graduation_project_flutter/widgets/custom_glass_card.dart';

ChallengeArea challengeAreaFromJson(String str) => ChallengeArea.fromJson(json.decode(str));

String challengeAreaToJson(ChallengeArea data) => json.encode(data.toJson());

class ChallengeArea {
    String? difficulty;
    String? description;

    ChallengeArea({
        this.difficulty,
        this.description,
    });

    ChallengeArea copyWith({
        String? difficulty,
        String? description,
    }) => 
        ChallengeArea(
            difficulty: difficulty ?? this.difficulty,
            description: description ?? this.description,
        );

    factory ChallengeArea.fromJson(Map<String, dynamic> json) => ChallengeArea(
        difficulty: json["difficulty"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "difficulty": difficulty,
        "description": description,
    };
}

//-----------------------------------------------------

// To parse this JSON data, do
//
//     final challengeEvent = challengeEventFromJson(jsonString);


ChallengeEvent challengeEventFromJson(String str) => ChallengeEvent.fromJson(json.decode(str));

String challengeEventToJson(ChallengeEvent data) => json.encode(data.toJson());

class ChallengeEvent {
    String? difficulty;
    String? description;

    ChallengeEvent({
        this.difficulty,
        this.description,
    });

    ChallengeEvent copyWith({
        String? difficulty,
        String? description,
    }) => 
        ChallengeEvent(
            difficulty: difficulty ?? this.difficulty,
            description: description ?? this.description,
        );

    factory ChallengeEvent.fromJson(Map<String, dynamic> json) => ChallengeEvent(
        difficulty: json["difficulty"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "difficulty": difficulty,
        "description": description,
    };
}

//++++++++++++++++++++++++++++++++++++++++++++++

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
        // Navigator.of(context).push(MaterialPageRoute(
        //           builder: (context) => const QyestionViewer()));
      },
      child: CustomGlassCard(
            margin: const EdgeInsets.all(15),
            height: 150,
            width: 150,
            borderRadius: BorderRadius.circular(400),
            child: const Center(
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
            child: const Center(
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
            child: const Center(
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