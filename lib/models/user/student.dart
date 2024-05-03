// To parse this JSON data, do
//
//     final student = studentFromJson(jsonString);

import 'dart:convert';

Student studentFromJson(String str) => Student.fromJson(json.decode(str));

String studentToJson(Student data) => json.encode(data.toJson());

class Student {
    String? firstName;
    String? lastName;
    DateTime? birthDate;
    String? gender;
    double? level;
    int? gpa;
    double? earnedPoints;

    Student({
        this.firstName,
        this.lastName,
        this.birthDate,
        this.gender,
        this.level,
        this.gpa,
        this.earnedPoints,
    });

    Student copyWith({
        String? firstName,
        String? lastName,
        DateTime? birthDate,
        String? gender,
        double? level,
        int? gpa,
        double? earnedPoints,
    }) => 
        Student(
            firstName: firstName ?? this.firstName,
            lastName: lastName ?? this.lastName,
            birthDate: birthDate ?? this.birthDate,
            gender: gender ?? this.gender,
            level: level ?? this.level,
            gpa: gpa ?? this.gpa,
            earnedPoints: earnedPoints ?? this.earnedPoints,
        );

    factory Student.fromJson(Map<String, dynamic> json) => Student(
        firstName: json["first_name"],
        lastName: json["last_name"],
        birthDate: json["birth_date"] == null ? null : DateTime.parse(json["birth_date"]),
        gender: json["gender"],
        level: json["level"]?.toDouble(),
        gpa: json["gpa"],
        earnedPoints: json["earned_points"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "birth_date": "${birthDate!.year.toString().padLeft(4, '0')}-${birthDate!.month.toString().padLeft(2, '0')}-${birthDate!.day.toString().padLeft(2, '0')}",
        "gender": gender,
        "level": level,
        "gpa": gpa,
        "earned_points": earnedPoints,
    };
}