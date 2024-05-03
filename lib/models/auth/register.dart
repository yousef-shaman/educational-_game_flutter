// To parse this JSON data, do
//
//     final userRegisterSer = userRegisterSerFromJson(jsonString);

import 'dart:convert';

UserRegisterSer userRegisterSerFromJson(String str) => UserRegisterSer.fromJson(json.decode(str));

String userRegisterSerToJson(UserRegisterSer data) => json.encode(data.toJson());

class UserRegisterSer {
    String? email;
    String? username;
    String? role;
    String? eduId;
    String? password;
    String? password2;

    UserRegisterSer({
        this.email,
        this.username,
        this.role,
        this.eduId,
        this.password,
        this.password2,
    });

    UserRegisterSer copyWith({
        String? email,
        String? username,
        String? role,
        String? eduId,
        String? password,
        String? password2,
    }) => 
        UserRegisterSer(
            email: email ?? this.email,
            username: username ?? this.username,
            role: role ?? this.role,
            eduId: eduId ?? this.eduId,
            password: password ?? this.password,
            password2: password2 ?? this.password2,
        );

    factory UserRegisterSer.fromJson(Map<String, dynamic> json) => UserRegisterSer(
        email: json["email"],
        username: json["username"],
        role: json["role"],
        eduId: json["edu_id"],
        password: json["password"],
        password2: json["password2"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "username": username,
        "role": role,
        "edu_id": eduId,
        "password": password,
        "password2": password2,
    };
}
