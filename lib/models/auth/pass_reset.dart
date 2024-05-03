// To parse this JSON data, do
//
//     final passwordResetRequest = passwordResetRequestFromJson(jsonString);


import 'dart:convert';

PasswordResetRequest passwordResetRequestFromJson(String str) => PasswordResetRequest.fromJson(json.decode(str));

String passwordResetRequestToJson(PasswordResetRequest data) => json.encode(data.toJson());

class PasswordResetRequest {
    String? email;

    PasswordResetRequest({
        this.email,
    });

    PasswordResetRequest copyWith({
        String? email,
    }) => 
        PasswordResetRequest(
            email: email ?? this.email,
        );

    factory PasswordResetRequest.fromJson(Map<String, dynamic> json) => PasswordResetRequest(
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
    };
}

