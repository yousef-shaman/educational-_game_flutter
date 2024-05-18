// To parse this JSON data, do
//
//     final topicArea = topicAreaFromJson(jsonString);

import 'dart:convert';

PostTopicArea topicAreaFromJson(String str) => PostTopicArea.fromJson(json.decode(str));

String topicAreaToJson(PostTopicArea data) => json.encode(data.toJson());

class PostTopicArea {
    int? areaId;
    int? facultyMemberId;
    String? topicTitle;
    String? source;
    String? description;

    PostTopicArea({
        this.areaId,
        this.facultyMemberId,
        this.topicTitle,
        this.source,
        this.description,
    });

    PostTopicArea copyWith({
        int? areaId,
        int? facultyMemberId,
        String? topicTitle,
        String? source,
        String? description,
    }) => 
        PostTopicArea(
            areaId: areaId ?? this.areaId,
            facultyMemberId: facultyMemberId ?? this.facultyMemberId,
            topicTitle: topicTitle ?? this.topicTitle,
            source: source ?? this.source,
            description: description ?? this.description,
        );

    factory PostTopicArea.fromJson(Map<String, dynamic> json) => PostTopicArea(
        areaId: json["area_id"],
        facultyMemberId: json["faculty_member_id"],
        topicTitle: json["topic_title"],
        source: json["source"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "area_id": areaId,
        "faculty_member_id": facultyMemberId,
        "topic_title": topicTitle,
        "source": source,
        "description": description,
    };
}

// To parse this JSON data, do
//
//     final getTopicArea = getTopicAreaFromJson(jsonString);

List<GetTopicArea> getTopicAreaFromJson(String str) => List<GetTopicArea>.from(json.decode(str).map((x) => GetTopicArea.fromJson(x)));

String getTopicAreaToJson(List<GetTopicArea> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetTopicArea {
    int? id;
    int? areaId;
    int? facultyMemberId;
    String? topicTitle;
    String? source;
    String? description;
    DateTime? dateCreated;
    DateTime? dateUbdated;

    GetTopicArea({
        this.id,
        this.areaId,
        this.facultyMemberId,
        this.topicTitle,
        this.source,
        this.description,
        this.dateCreated,
        this.dateUbdated,
    });

    GetTopicArea copyWith({
        int? id,
        int? areaId,
        int? facultyMemberId,
        String? topicTitle,
        String? source,
        String? description,
        DateTime? dateCreated,
        DateTime? dateUbdated,
    }) => 
        GetTopicArea(
            id: id ?? this.id,
            areaId: areaId ?? this.areaId,
            facultyMemberId: facultyMemberId ?? this.facultyMemberId,
            topicTitle: topicTitle ?? this.topicTitle,
            source: source ?? this.source,
            description: description ?? this.description,
            dateCreated: dateCreated ?? this.dateCreated,
            dateUbdated: dateUbdated ?? this.dateUbdated,
        );

    factory GetTopicArea.fromJson(Map<String, dynamic> json) => GetTopicArea(
        id: json["id"],
        areaId: json["area_id"],
        facultyMemberId: json["faculty_member_id"],
        topicTitle: json["topic_title"],
        source: json["source"],
        description: json["description"],
        dateCreated: json["date_created"] == null ? null : DateTime.parse(json["date_created"]),
        dateUbdated: json["date_ubdated"] == null ? null : DateTime.parse(json["date_ubdated"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "area_id": areaId,
        "faculty_member_id": facultyMemberId,
        "topic_title": topicTitle,
        "source": source,
        "description": description,
        "date_created": "${dateCreated!.year.toString().padLeft(4, '0')}-${dateCreated!.month.toString().padLeft(2, '0')}-${dateCreated!.day.toString().padLeft(2, '0')}",
        "date_ubdated": "${dateUbdated!.year.toString().padLeft(4, '0')}-${dateUbdated!.month.toString().padLeft(2, '0')}-${dateUbdated!.day.toString().padLeft(2, '0')}",
    };
}
