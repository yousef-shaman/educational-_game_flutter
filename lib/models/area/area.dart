// To parse this JSON data, do
//
//     final area = areaFromJson(jsonString);

import 'dart:convert';

PostArea areaFromJson(String str) => PostArea.fromJson(json.decode(str));

String areaToJson(PostArea data) => json.encode(data.toJson());

class PostArea {
    int? adminProfile;
    int? facultyDepartment;
    String? areaName;
    String? description;
    bool? isActive;

    PostArea({
        this.adminProfile,
        this.facultyDepartment,
        this.areaName,
        this.description,
        this.isActive,
    });

    PostArea copyWith({
        int? adminProfile,
        int? facultyDepartment,
        String? areaName,
        String? description,
        bool? isActive,
    }) => 
        PostArea(
            adminProfile: adminProfile ?? this.adminProfile,
            facultyDepartment: facultyDepartment ?? this.facultyDepartment,
            areaName: areaName ?? this.areaName,
            description: description ?? this.description,
            isActive: isActive ?? this.isActive,
        );

    factory PostArea.fromJson(Map<String, dynamic> json) => PostArea(
        adminProfile: json["admin_profile"],
        facultyDepartment: json["faculty_department"],
        areaName: json["area_name"],
        description: json["description"],
        isActive: json["is_active"],
    );

    Map<String, dynamic> toJson() => {
        "admin_profile": adminProfile,
        "faculty_department": facultyDepartment,
        "area_name": areaName,
        "description": description,
        "is_active": isActive,
    };
}

// To parse this JSON data, do
//
//     final getArea = getAreaFromJson(jsonString);


List<GetArea> getAreaFromJson(String str) => List<GetArea>.from(json.decode(str).map((x) => GetArea.fromJson(x)));

String getAreaToJson(List<GetArea> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetArea {
    int? id;
    int? adminProfile;
    int? facultyDepartment;
    String? areaName;
    String? description;
    bool? isActive;
    DateTime? dateCreated;
    DateTime? dateUbdated;

    GetArea({
        this.id,
        this.adminProfile,
        this.facultyDepartment,
        this.areaName,
        this.description,
        this.isActive,
        this.dateCreated,
        this.dateUbdated,
    });

    GetArea copyWith({
        int? id,
        int? adminProfile,
        int? facultyDepartment,
        String? areaName,
        String? description,
        bool? isActive,
        DateTime? dateCreated,
        DateTime? dateUbdated,
    }) => 
        GetArea(
            id: id ?? this.id,
            adminProfile: adminProfile ?? this.adminProfile,
            facultyDepartment: facultyDepartment ?? this.facultyDepartment,
            areaName: areaName ?? this.areaName,
            description: description ?? this.description,
            isActive: isActive ?? this.isActive,
            dateCreated: dateCreated ?? this.dateCreated,
            dateUbdated: dateUbdated ?? this.dateUbdated,
        );

    factory GetArea.fromJson(Map<String, dynamic> json) => GetArea(
        id: json["id"],
        adminProfile: json["admin_profile"],
        facultyDepartment: json["faculty_department"],
        areaName: json["area_name"],
        description: json["description"],
        isActive: json["is_active"],
        dateCreated: json["date_created"] == null ? null : DateTime.parse(json["date_created"]),
        dateUbdated: json["date_ubdated"] == null ? null : DateTime.parse(json["date_ubdated"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "admin_profile": adminProfile,
        "faculty_department": facultyDepartment,
        "area_name": areaName,
        "description": description,
        "is_active": isActive,
        "date_created": "${dateCreated!.year.toString().padLeft(4, '0')}-${dateCreated!.month.toString().padLeft(2, '0')}-${dateCreated!.day.toString().padLeft(2, '0')}",
        "date_ubdated": "${dateUbdated!.year.toString().padLeft(4, '0')}-${dateUbdated!.month.toString().padLeft(2, '0')}-${dateUbdated!.day.toString().padLeft(2, '0')}",
    };
}

