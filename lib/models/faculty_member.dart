// To parse this JSON data, do
//
//     final facultyMember = facultyMemberFromJson(jsonString);

import 'dart:convert';

FacultyMember facultyMemberFromJson(String str) => FacultyMember.fromJson(json.decode(str));

String facultyMemberToJson(FacultyMember data) => json.encode(data.toJson());

class FacultyMember {
    String? firstName;
    String? lastName;
    DateTime? birthDate;
    String? gender;

    FacultyMember({
        this.firstName,
        this.lastName,
        this.birthDate,
        this.gender,
    });

    FacultyMember copyWith({
        String? firstName,
        String? lastName,
        DateTime? birthDate,
        String? gender,
    }) => 
        FacultyMember(
            firstName: firstName ?? this.firstName,
            lastName: lastName ?? this.lastName,
            birthDate: birthDate ?? this.birthDate,
            gender: gender ?? this.gender,
        );

    factory FacultyMember.fromJson(Map<String, dynamic> json) => FacultyMember(
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
