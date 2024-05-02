// To parse this JSON data, do
//
//     final facultyDepartmen = facultyDepartmenFromJson(jsonString);

import 'dart:convert';

FacultyDepartmen facultyDepartmenFromJson(String str) => FacultyDepartmen.fromJson(json.decode(str));

String facultyDepartmenToJson(FacultyDepartmen data) => json.encode(data.toJson());

class FacultyDepartmen {
    String? departmentName;
    String? facultyName;
    String? description;
    bool? isActive;

    FacultyDepartmen({
        this.departmentName,
        this.facultyName,
        this.description,
        this.isActive,
    });

    FacultyDepartmen copyWith({
        String? departmentName,
        String? facultyName,
        String? description,
        bool? isActive,
    }) => 
        FacultyDepartmen(
            departmentName: departmentName ?? this.departmentName,
            facultyName: facultyName ?? this.facultyName,
            description: description ?? this.description,
            isActive: isActive ?? this.isActive,
        );

    factory FacultyDepartmen.fromJson(Map<String, dynamic> json) => FacultyDepartmen(
        departmentName: json["department_name"],
        facultyName: json["faculty_name"],
        description: json["description"],
        isActive: json["is_active"],
    );

    Map<String, dynamic> toJson() => {
        "department_name": departmentName,
        "faculty_name": facultyName,
        "description": description,
        "is_active": isActive,
    };
}
