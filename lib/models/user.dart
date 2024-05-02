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


//_____________________________________________________


// To parse this JSON data, do
//
//     final verifyUserEmail = verifyUserEmailFromJson(jsonString);


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


//________________________________________________________________________


// To parse this JSON data, do
//
//     final loginUser = loginUserFromJson(jsonString);


// LoginUser loginUserFromJson(String str) => LoginUser.fromJson(json.decode(str));

// String loginUserToJson(LoginUser data) => json.encode(data.toJson());

// class LoginUser {
//     String? email;
//     String? password;

//     LoginUser({
//         this.email,
//         this.password,
//     });

//     LoginUser copyWith({
//         String? email,
//         String? password,
//     }) => 
//         LoginUser(
//             email: email ?? this.email,
//             password: password ?? this.password,
//         );

//     factory LoginUser.fromJson(Map<String, dynamic> json) => LoginUser(
//         email: json["email"],
//         password: json["password"],
//     );

//     Map<String, dynamic> toJson() => {
//         "email": email,
//         "password": password,
//     };
// }

//+++++++++++++++++++++++++++++

// To parse this JSON data, do
//
//     final loginUser = loginUserFromJson(jsonString);


// To parse this JSON data, do
//
//     final loginUser = loginUserFromJson(jsonString);


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



//_____________________________________________________________________



// To parse this JSON data, do
//
//     final passwordResetRequest = passwordResetRequestFromJson(jsonString);


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


//________________________________________________________________________


// To parse this JSON data, do
//
//     final tokenRefresh = tokenRefreshFromJson(jsonString);


TokenRefresh tokenRefreshFromJson(String str) => TokenRefresh.fromJson(json.decode(str));

String tokenRefreshToJson(TokenRefresh data) => json.encode(data.toJson());

class TokenRefresh {
    String? refresh;

    TokenRefresh({
        this.refresh,
    });

    TokenRefresh copyWith({
        String? refresh,
    }) => 
        TokenRefresh(
            refresh: refresh ?? this.refresh,
        );

    factory TokenRefresh.fromJson(Map<String, dynamic> json) => TokenRefresh(
        refresh: json["refresh"],
    );

    Map<String, dynamic> toJson() => {
        "refresh": refresh,
    };
}


//____________________________________________________________________

// To parse this JSON data, do
//
//     final setNewPassword = setNewPasswordFromJson(jsonString);

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

