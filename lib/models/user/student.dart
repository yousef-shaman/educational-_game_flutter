// To parse this JSON data, do
//
//     final student = studentFromJson(jsonString);

import 'dart:convert';

Student studentFromJson(String str) => Student.fromJson(json.decode(str));

String studentToJson(Student data) => json.encode(data.toJson());

class Student {
    int? facultyDepartment;
    DateTime? birthDate;
    String? gender;
    double? level;
    int? gpa;
    double? earnedPoints;

    Student({
        this.facultyDepartment,
        this.birthDate,
        this.gender,
        this.level,
        this.gpa,
        this.earnedPoints,
    });

    Student copyWith({
        int? facultyDepartment,
        DateTime? birthDate,
        String? gender,
        double? level,
        int? gpa,
        double? earnedPoints,
    }) => 
        Student(
            facultyDepartment: facultyDepartment ?? this.facultyDepartment,
            birthDate: birthDate ?? this.birthDate,
            gender: gender ?? this.gender,
            level: level ?? this.level,
            gpa: gpa ?? this.gpa,
            earnedPoints: earnedPoints ?? this.earnedPoints,
        );

    factory Student.fromJson(Map<String, dynamic> json) => Student(
        facultyDepartment: json["faculty_department"],
        birthDate: json["birth_date"] == null ? null : DateTime.parse(json["birth_date"]),
        gender: json["gender"],
        level: json["level"]?.toDouble(),
        gpa: json["gpa"],
        earnedPoints: json["earned_points"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "faculty_department": facultyDepartment,
        "birth_date": "${birthDate!.year.toString().padLeft(4, '0')}-${birthDate!.month.toString().padLeft(2, '0')}-${birthDate!.day.toString().padLeft(2, '0')}",
        "gender": gender,
        "level": level,
        "gpa": gpa,
        "earned_points": earnedPoints,
    };
}



// To parse this JSON data, do
//
//     final getStudent = getStudentFromJson(jsonString);


List<GetStudent> getStudentFromJson(String str) => List<GetStudent>.from(json.decode(str).map((x) => GetStudent.fromJson(x)));

String getStudentToJson(List<GetStudent> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetStudent {
    int? id;
    int? facultyDepartment;
    DateTime? birthDate;
    String? gender;
    int? level;
    double? gpa;
    int? earnedPoints;

    GetStudent({
        this.id,
        this.facultyDepartment,
        this.birthDate,
        this.gender,
        this.level,
        this.gpa,
        this.earnedPoints,
    });

    GetStudent copyWith({
        int? id,
        int? facultyDepartment,
        DateTime? birthDate,
        String? gender,
        int? level,
        double? gpa,
        int? earnedPoints,
    }) => 
        GetStudent(
            id: id ?? this.id,
            facultyDepartment: facultyDepartment ?? this.facultyDepartment,
            birthDate: birthDate ?? this.birthDate,
            gender: gender ?? this.gender,
            level: level ?? this.level,
            gpa: gpa ?? this.gpa,
            earnedPoints: earnedPoints ?? this.earnedPoints,
        );

    factory GetStudent.fromJson(Map<String, dynamic> json) => GetStudent(
        id: json["id"],
        facultyDepartment: json["faculty_department"],
        birthDate: json["birth_date"] == null ? null : DateTime.parse(json["birth_date"]),
        gender: json["gender"],
        level: json["level"]?.toInt(),
        gpa: json["gpa"],
        earnedPoints: json["earned_points"]?.toInt(),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "faculty_department": facultyDepartment,
        "birth_date": "${birthDate!.year.toString().padLeft(4, '0')}-${birthDate!.month.toString().padLeft(2, '0')}-${birthDate!.day.toString().padLeft(2, '0')}",
        "gender": gender,
        "level": level,
        "gpa": gpa,
        "earned_points": earnedPoints,
    };
}
