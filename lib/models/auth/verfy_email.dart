// To parse this JSON data, do
//
//     final verifyUserEmail = verifyUserEmailFromJson(jsonString);


import 'dart:convert';

VerifyUserEmail verifyUserEmailFromJson(String str) => VerifyUserEmail.fromJson(json.decode(str));

String verifyUserEmailToJson(VerifyUserEmail data) => json.encode(data.toJson());

class VerifyUserEmail {
    String? otp;

    VerifyUserEmail({
        this.otp,
    });

    VerifyUserEmail copyWith({
        String? otp,
    }) => 
        VerifyUserEmail(
            otp: otp ?? this.otp,
        );

    factory VerifyUserEmail.fromJson(Map<String, dynamic> json) => VerifyUserEmail(
        otp: json["otp"],
    );

    Map<String, dynamic> toJson() => {
        "otp": otp,
    };
}
