// To parse this JSON data, do
//
//     final facultyMember = facultyMemberFromJson(jsonString);

import 'dart:convert';

FacultyMember facultyMemberFromJson(String str) => FacultyMember.fromJson(json.decode(str));

String facultyMemberToJson(FacultyMember data) => json.encode(data.toJson());

class FacultyMember {
    int? facultyDepartment;
    DateTime? birthDate;
    String? gender;

    FacultyMember({
        this.facultyDepartment,
        this.birthDate,
        this.gender,
    });

    FacultyMember copyWith({
        int? facultyDepartment,
        DateTime? birthDate,
        String? gender,
    }) => 
        FacultyMember(
            facultyDepartment: facultyDepartment ?? this.facultyDepartment,
            birthDate: birthDate ?? this.birthDate,
            gender: gender ?? this.gender,
        );

    factory FacultyMember.fromJson(Map<String, dynamic> json) => FacultyMember(
        facultyDepartment: json["faculty_department"],
        birthDate: json["birth_date"] == null ? null : DateTime.parse(json["birth_date"]),
        gender: json["gender"],
    );

    Map<String, dynamic> toJson() => {
        "faculty_department": facultyDepartment,
        "birth_date": "${birthDate!.year.toString().padLeft(4, '0')}-${birthDate!.month.toString().padLeft(2, '0')}-${birthDate!.day.toString().padLeft(2, '0')}",
        "gender": gender,
    };
}
