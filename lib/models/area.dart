import 'package:flutter/material.dart';
import 'package:graduation_project_flutter/views/student/student_viewer.dart';
import 'package:graduation_project_flutter/widgets/custom_glass_card.dart';


class Area {
  final int areaID;
  final int studyPlanID;
  final int creditHours;
  final int maxPoints;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String areaName;
  final String? description;

  Area({
    required this.areaID,
    required this.studyPlanID,
    required this.creditHours,
    required this.maxPoints,
    required this.createdAt,
    required this.updatedAt,
    required this.areaName,
    this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'areaID': areaID,
      'studyPlanID': studyPlanID,
      'creditHours': creditHours,
      'maxPoints': maxPoints,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'areaName': areaName,
      'description': description,
    };
  }

  factory Area.fromMap(Map<String, dynamic> map) {
    return Area(
      areaID: map['areaID'],
      studyPlanID: map['studyPlanID'],
      creditHours: map['creditHours'],
      maxPoints: map['maxPoints'],
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
      areaName: map['areaName'],
      description: map['description'],
    );
  }
}



Widget buildAreaList(BuildContext context, List<dynamic> data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, i) {
        var areaData = data[i];
        return InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => StudentViewer(
                        dataOfTopics: areaData,
                      )));
            },
            child: CustomGlassCard(
              margin: const EdgeInsets.all(15),
              borderRadius: BorderRadius.circular(20),
              height: 150,
              content: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  areaData["title"] ?? 'Untitled Area',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
            ));
      },
    );
  }
