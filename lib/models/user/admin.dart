// To parse this JSON data, do
//
//     final systemAdmin = systemAdminFromJson(jsonString);

import 'dart:convert';

SystemAdmin systemAdminFromJson(String str) => SystemAdmin.fromJson(json.decode(str));

String systemAdminToJson(SystemAdmin data) => json.encode(data.toJson());

class SystemAdmin {
    DateTime? birthDate;
    String? gender;

    SystemAdmin({
        this.birthDate,
        this.gender,
    });

    SystemAdmin copyWith({
        DateTime? birthDate,
        String? gender,
    }) => 
        SystemAdmin(
            birthDate: birthDate ?? this.birthDate,
            gender: gender ?? this.gender,
        );

    factory SystemAdmin.fromJson(Map<String, dynamic> json) => SystemAdmin(
        birthDate: json["birth_date"] == null ? null : DateTime.parse(json["birth_date"]),
        gender: json["gender"],
    );

    Map<String, dynamic> toJson() => {
        "birth_date": "${birthDate!.year.toString().padLeft(4, '0')}-${birthDate!.month.toString().padLeft(2, '0')}-${birthDate!.day.toString().padLeft(2, '0')}",
        "gender": gender,
    };
}

// To parse this JSON data, do
//
//     final getSystemAdmin = getSystemAdminFromJson(jsonString);

List<GetSystemAdmin> getSystemAdminFromJson(String str) => List<GetSystemAdmin>.from(json.decode(str).map((x) => GetSystemAdmin.fromJson(x)));

String getSystemAdminToJson(List<GetSystemAdmin> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetSystemAdmin {
    int? id;
    DateTime? birthDate;
    String? gender;

    GetSystemAdmin({
        this.id,
        this.birthDate,
        this.gender,
    });

    GetSystemAdmin copyWith({
        int? id,
        DateTime? birthDate,
        String? gender,
    }) => 
        GetSystemAdmin(
            id: id ?? this.id,
            birthDate: birthDate ?? this.birthDate,
            gender: gender ?? this.gender,
        );

    factory GetSystemAdmin.fromJson(Map<String, dynamic> json) => GetSystemAdmin(
        id: json["id"],
        birthDate: json["birth_date"] == null ? null : DateTime.parse(json["birth_date"]),
        gender: json["gender"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "birth_date": "${birthDate!.year.toString().padLeft(4, '0')}-${birthDate!.month.toString().padLeft(2, '0')}-${birthDate!.day.toString().padLeft(2, '0')}",
        "gender": gender,
    };
}

