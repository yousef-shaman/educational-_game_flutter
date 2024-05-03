// To parse this JSON data, do
//
//     final setNewPassword = setNewPasswordFromJson(jsonString);

import 'dart:convert';

SetNewPassword setNewPasswordFromJson(String str) => SetNewPassword.fromJson(json.decode(str));

String setNewPasswordToJson(SetNewPassword data) => json.encode(data.toJson());

class SetNewPassword {
    String? password;
    String? confirmPassword;
    String? uidb64;
    String? token;

    SetNewPassword({
        this.password,
        this.confirmPassword,
        this.uidb64,
        this.token,
    });

    SetNewPassword copyWith({
        String? password,
        String? confirmPassword,
        String? uidb64,
        String? token,
    }) => 
        SetNewPassword(
            password: password ?? this.password,
            confirmPassword: confirmPassword ?? this.confirmPassword,
            uidb64: uidb64 ?? this.uidb64,
            token: token ?? this.token,
        );

    factory SetNewPassword.fromJson(Map<String, dynamic> json) => SetNewPassword(
        password: json["password"],
        confirmPassword: json["confirm_password"],
        uidb64: json["uidb64"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "password": password,
        "confirm_password": confirmPassword,
        "uidb64": uidb64,
        "token": token,
    };
}
