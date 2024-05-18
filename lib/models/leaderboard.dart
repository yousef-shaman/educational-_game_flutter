// To parse this JSON data, do
//
//     final getLeaderboard = getLeaderboardFromJson(jsonString);

import 'dart:convert';

List<GetLeaderboard> getLeaderboardFromJson(String str) => List<GetLeaderboard>.from(json.decode(str).map((x) => GetLeaderboard.fromJson(x)));

String getLeaderboardToJson(List<GetLeaderboard> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetLeaderboard {
    int? id;
    int? facultyDepartment;
    DateTime? birthDate;
    String? gender;
    int? level;
    double? gpa;
    int? earnedPoints;
    String? firstName;
    String? lastName;

    GetLeaderboard({
        this.id,
        this.facultyDepartment,
        this.birthDate,
        this.gender,
        this.level,
        this.gpa,
        this.earnedPoints,
        this.firstName,
        this.lastName,
    });

    GetLeaderboard copyWith({
        int? id,
        int? facultyDepartment,
        DateTime? birthDate,
        String? gender,
        int? level,
        double? gpa,
        int? earnedPoints,
        String? firstName,
        String? lastName,
    }) => 
        GetLeaderboard(
            id: id ?? this.id,
            facultyDepartment: facultyDepartment ?? this.facultyDepartment,
            birthDate: birthDate ?? this.birthDate,
            gender: gender ?? this.gender,
            level: level ?? this.level,
            gpa: gpa ?? this.gpa,
            earnedPoints: earnedPoints ?? this.earnedPoints,
            firstName: firstName ?? this.firstName,
            lastName: lastName ?? this.lastName,
        );

    factory GetLeaderboard.fromJson(Map<String, dynamic> json) => GetLeaderboard(
        id: json["id"],
        facultyDepartment: json["faculty_department"],
        birthDate: json["birth_date"] == null ? null : DateTime.parse(json["birth_date"]),
        gender: json["gender"],
        level: json["level"]?.toInt(),
        gpa: json["gpa"],
        earnedPoints: json["earned_points"]?.toInt(),
        firstName: json["user"]["first_name"],
        lastName: json["user"]["last_name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "faculty_department": facultyDepartment,
        "birth_date": "${birthDate!.year.toString().padLeft(4, '0')}-${birthDate!.month.toString().padLeft(2, '0')}-${birthDate!.day.toString().padLeft(2, '0')}",
        "gender": gender,
        "level": level,
        "gpa": gpa,
        "earned_points": earnedPoints,
        "user": {
          "first_name": firstName,
          "last_name": lastName,
        }
    };
}
