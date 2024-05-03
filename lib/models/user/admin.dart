// To parse this JSON data, do
//
//     final systemAdmin = systemAdminFromJson(jsonString);

import 'dart:convert';

SystemAdmin systemAdminFromJson(String str) => SystemAdmin.fromJson(json.decode(str));

String systemAdminToJson(SystemAdmin data) => json.encode(data.toJson());

class SystemAdmin {
    String? firstName;
    String? lastName;
    DateTime? birthDate;
    String? gender;

    SystemAdmin({
        this.firstName,
        this.lastName,
        this.birthDate,
        this.gender,
    });

    SystemAdmin copyWith({
        String? firstName,
        String? lastName,
        DateTime? birthDate,
        String? gender,
    }) => 
        SystemAdmin(
            firstName: firstName ?? this.firstName,
            lastName: lastName ?? this.lastName,
            birthDate: birthDate ?? this.birthDate,
            gender: gender ?? this.gender,
        );

    factory SystemAdmin.fromJson(Map<String, dynamic> json) => SystemAdmin(
        firstName: json["first_name"],
        lastName: json["last_name"],
        birthDate: json["birth_date"] == null ? null : DateTime.parse(json["birth_date"]),
        gender: json["gender"],
    );

    Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "birth_date": "${birthDate!.year.toString().padLeft(4, '0')}-${birthDate!.month.toString().padLeft(2, '0')}-${birthDate!.day.toString().padLeft(2, '0')}",
        "gender": gender,
    };
}
