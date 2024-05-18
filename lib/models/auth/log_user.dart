// To parse this JSON data, do
//
//     final loginUser = loginUserFromJson(jsonString);


import 'dart:convert';

LoginUser loginUserFromJson(String str) => LoginUser.fromJson(json.decode(str));

String loginUserToJson(LoginUser data) => json.encode(data.toJson());

class LoginUser {
    String? email;
    String? password;
    String? fullName;
    String? accessToken;
    String? role;
    String? eduId;
    String? refreshToken;

    LoginUser({
        this.email,
        this.password,
        this.fullName,
        this.accessToken,
        this.role,
        this.eduId,
        this.refreshToken,
    });

    LoginUser copyWith({
        String? email,
        String? password,
        String? fullName,
        String? accessToken,
        String? role,
        String? eduId,
        String? refreshToken,
    }) => 
        LoginUser(
            email: email ?? this.email,
            password: password ?? this.password,
            fullName: fullName ?? this.fullName,
            accessToken: accessToken ?? this.accessToken,
            role: role ?? this.role,
            eduId: eduId ?? this.eduId,
            refreshToken: refreshToken ?? this.refreshToken,
        );

    factory LoginUser.fromJson(Map<String, dynamic> json) => LoginUser(
        email: json["email"],
        password: json["password"],
        fullName: json["full_name"],
        accessToken: json["access_token"],
        role: json["role"],
        eduId: json["edu_id"],
        refreshToken: json["refresh_token"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "full_name": fullName,
        "access_token": accessToken,
        "role": role,
        "edu_id": eduId,
        "refresh_token": refreshToken,
    };
}


// To parse this JSON data, do
//
//     final logoutUser = logoutUserFromJson(jsonString);


LogoutUser logoutUserFromJson(String str) => LogoutUser.fromJson(json.decode(str));

String logoutUserToJson(LogoutUser data) => json.encode(data.toJson());

class LogoutUser {
    String? refreshToken;

    LogoutUser({
        this.refreshToken,
    });

    LogoutUser copyWith({
        String? refreshToken,
    }) => 
        LogoutUser(
            refreshToken: refreshToken ?? this.refreshToken,
        );

    factory LogoutUser.fromJson(Map<String, dynamic> json) => LogoutUser(
        refreshToken: json["refresh_token"],
    );

    Map<String, dynamic> toJson() => {
        "refresh_token": refreshToken,
    };
}



