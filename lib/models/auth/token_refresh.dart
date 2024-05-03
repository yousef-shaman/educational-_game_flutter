// To parse this JSON data, do
//
//     final tokenRefresh = tokenRefreshFromJson(jsonString);


import 'dart:convert';

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

