import 'package:flutter/material.dart';

class Event {
  final int eventID;
  final int facultyDepartmentID;
  final DateTime startTime;
  final DateTime endTime;
  final int totalPoints;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String eventName;
  final String? description;

  Event({
    required this.eventID,
    required this.facultyDepartmentID,
    required this.startTime,
    required this.endTime,
    required this.totalPoints,
    required this.createdAt,
    required this.updatedAt,
    required this.eventName,
    this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'eventID': eventID,
      'facultyDepartmentID': facultyDepartmentID,
      'startTime': startTime.toIso8601String(),
      'endTime': endTime.toIso8601String(),
      'totalPoints': totalPoints,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'eventName': eventName,
      'description': description,
    };
  }

  factory Event.fromMap(Map<String, dynamic> map) {
    return Event(
      eventID: map['eventID'],
      facultyDepartmentID: map['facultyDepartmentID'],
      startTime: DateTime.parse(map['startTime']),
      endTime: DateTime.parse(map['endTime']),
      totalPoints: map['totalPoints'],
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
      eventName: map['eventName'],
      description: map['description'],
    );
  }
}


Widget buildEventTab() {
    // You can use a similar FutureBuilder pattern for events as well if needed
    return const Center(
      child: Text(
        "Events",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          fontSize: 25,
          color: Color(0xff191923),
        ),
      ),
    );
  }