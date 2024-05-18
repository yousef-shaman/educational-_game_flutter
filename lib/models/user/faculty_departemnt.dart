// To parse this JSON data, do
//
//     final facultyDepartmen = facultyDepartmenFromJson(jsonString);

import 'dart:convert';

PostFacultyDepartmen facultyDepartmenFromJson(String str) => PostFacultyDepartmen.fromJson(json.decode(str));

String facultyDepartmenToJson(PostFacultyDepartmen data) => json.encode(data.toJson());

class PostFacultyDepartmen {
    String? departmentName;
    String? facultyName;
    String? description;
    bool? isActive;

    PostFacultyDepartmen({
        this.departmentName,
        this.facultyName,
        this.description,
        this.isActive,
    });

    PostFacultyDepartmen copyWith({
        String? departmentName,
        String? facultyName,
        String? description,
        bool? isActive,
    }) => 
        PostFacultyDepartmen(
            departmentName: departmentName ?? this.departmentName,
            facultyName: facultyName ?? this.facultyName,
            description: description ?? this.description,
            isActive: isActive ?? this.isActive,
        );

    factory PostFacultyDepartmen.fromJson(Map<String, dynamic> json) => PostFacultyDepartmen(
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


// To parse this JSON data, do
//
//     final getFacultyDepartmen = getFacultyDepartmenFromJson(jsonString);


List<GetFacultyDepartmen> getFacultyDepartmenFromJson(String str) => List<GetFacultyDepartmen>.from(json.decode(str).map((x) => GetFacultyDepartmen.fromJson(x)));

String getFacultyDepartmenToJson(List<GetFacultyDepartmen> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetFacultyDepartmen {
    int? id;
    int? adminProfile;
    String? departmentName;
    String? facultyName;
    String? description;
    bool? isActive;
    DateTime? dateCreated;
    DateTime? dateUbdated;

    GetFacultyDepartmen({
        this.id,
        this.adminProfile,
        this.departmentName,
        this.facultyName,
        this.description,
        this.isActive,
        this.dateCreated,
        this.dateUbdated,
    });

    GetFacultyDepartmen copyWith({
        int? id,
        int? adminProfile,
        String? departmentName,
        String? facultyName,
        String? description,
        bool? isActive,
        DateTime? dateCreated,
        DateTime? dateUbdated,
    }) => 
        GetFacultyDepartmen(
            id: id ?? this.id,
            adminProfile: adminProfile ?? this.adminProfile,
            departmentName: departmentName ?? this.departmentName,
            facultyName: facultyName ?? this.facultyName,
            description: description ?? this.description,
            isActive: isActive ?? this.isActive,
            dateCreated: dateCreated ?? this.dateCreated,
            dateUbdated: dateUbdated ?? this.dateUbdated,
        );

    factory GetFacultyDepartmen.fromJson(Map<String, dynamic> json) => GetFacultyDepartmen(
        id: json["id"],
        adminProfile: json["admin_profile"],
        departmentName: json["department_name"],
        facultyName: json["faculty_name"],
        description: json["description"],
        isActive: json["is_active"],
        dateCreated: json["date_created"] == null ? null : DateTime.parse(json["date_created"]),
        dateUbdated: json["date_ubdated"] == null ? null : DateTime.parse(json["date_ubdated"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "admin_profile": adminProfile,
        "department_name": departmentName,
        "faculty_name": facultyName,
        "description": description,
        "is_active": isActive,
        "date_created": "${dateCreated!.year.toString().padLeft(4, '0')}-${dateCreated!.month.toString().padLeft(2, '0')}-${dateCreated!.day.toString().padLeft(2, '0')}",
        "date_ubdated": "${dateUbdated!.year.toString().padLeft(4, '0')}-${dateUbdated!.month.toString().padLeft(2, '0')}-${dateUbdated!.day.toString().padLeft(2, '0')}",
    };
}
