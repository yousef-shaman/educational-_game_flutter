// To parse this JSON data, do
//
//     final challengeArea = challengeAreaFromJson(jsonString);

import 'dart:convert';

PostChallengeArea challengeAreaFromJson(String str) => PostChallengeArea.fromJson(json.decode(str));

String challengeAreaToJson(PostChallengeArea data) => json.encode(data.toJson());

class PostChallengeArea {
    int? topicAreaId;
    String? difficulty;
    String? description;

    PostChallengeArea({
        this.topicAreaId,
        this.difficulty,
        this.description,
    });

    PostChallengeArea copyWith({
        int? topicAreaId,
        String? difficulty,
        String? description,
    }) => 
        PostChallengeArea(
            topicAreaId: topicAreaId ?? this.topicAreaId,
            difficulty: difficulty ?? this.difficulty,
            description: description ?? this.description,
        );

    factory PostChallengeArea.fromJson(Map<String, dynamic> json) => PostChallengeArea(
        topicAreaId: json["topic_area_id"],
        difficulty: json["difficulty"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "topic_area_id": topicAreaId,
        "difficulty": difficulty,
        "description": description,
    };
}

// To parse this JSON data, do
//
//     final getChallengeArea = getChallengeAreaFromJson(jsonString);


List<GetChallengeArea> getChallengeAreaFromJson(String str) => List<GetChallengeArea>.from(json.decode(str).map((x) => GetChallengeArea.fromJson(x)));

String getChallengeAreaToJson(List<GetChallengeArea> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetChallengeArea {
    int? id;
    int? topicAreaId;
    String? difficulty;
    String? description;
    DateTime? dateCreated;
    DateTime? dateUbdated;

    GetChallengeArea({
        this.id,
        this.topicAreaId,
        this.difficulty,
        this.description,
        this.dateCreated,
        this.dateUbdated,
    });

    GetChallengeArea copyWith({
        int? id,
        int? topicAreaId,
        String? difficulty,
        String? description,
        DateTime? dateCreated,
        DateTime? dateUbdated,
    }) => 
        GetChallengeArea(
            id: id ?? this.id,
            topicAreaId: topicAreaId ?? this.topicAreaId,
            difficulty: difficulty ?? this.difficulty,
            description: description ?? this.description,
            dateCreated: dateCreated ?? this.dateCreated,
            dateUbdated: dateUbdated ?? this.dateUbdated,
        );

    factory GetChallengeArea.fromJson(Map<String, dynamic> json) => GetChallengeArea(
        id: json["id"],
        topicAreaId: json["topic_area_id"],
        difficulty: json["difficulty"],
        description: json["description"],
        dateCreated: json["date_created"] == null ? null : DateTime.parse(json["date_created"]),
        dateUbdated: json["date_ubdated"] == null ? null : DateTime.parse(json["date_ubdated"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "topic_area_id": topicAreaId,
        "difficulty": difficulty,
        "description": description,
        "date_created": "${dateCreated!.year.toString().padLeft(4, '0')}-${dateCreated!.month.toString().padLeft(2, '0')}-${dateCreated!.day.toString().padLeft(2, '0')}",
        "date_ubdated": "${dateUbdated!.year.toString().padLeft(4, '0')}-${dateUbdated!.month.toString().padLeft(2, '0')}-${dateUbdated!.day.toString().padLeft(2, '0')}",
    };
}

