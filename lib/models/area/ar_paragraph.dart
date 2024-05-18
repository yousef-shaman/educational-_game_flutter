// To parse this JSON data, do
//
//     final paragraphArea = paragraphAreaFromJson(jsonString);

import 'dart:convert';

PostParagraphArea paragraphAreaFromJson(String str) => PostParagraphArea.fromJson(json.decode(str));

String paragraphAreaToJson(PostParagraphArea data) => json.encode(data.toJson());

class PostParagraphArea {
    int? topicAreaId;
    String? paragraphTitle;
    String? content;
    String? example;

    PostParagraphArea({
        this.topicAreaId,
        this.paragraphTitle,
        this.content,
        this.example,
    });

    PostParagraphArea copyWith({
        int? topicAreaId,
        String? paragraphTitle,
        String? content,
        String? example,
    }) => 
        PostParagraphArea(
            topicAreaId: topicAreaId ?? this.topicAreaId,
            paragraphTitle: paragraphTitle ?? this.paragraphTitle,
            content: content ?? this.content,
            example: example ?? this.example,
        );

    factory PostParagraphArea.fromJson(Map<String, dynamic> json) => PostParagraphArea(
        topicAreaId: json["topic_area_id"],
        paragraphTitle: json["paragraph_title"],
        content: json["content"],
        example: json["example"],
    );

    Map<String, dynamic> toJson() => {
        "topic_area_id": topicAreaId,
        "paragraph_title": paragraphTitle,
        "content": content,
        "example": example,
    };
}

// To parse this JSON data, do
//
//     final getParagraphArea = getParagraphAreaFromJson(jsonString);


// To parse this JSON data, do
//
//     final getParagraphArea = getParagraphAreaFromJson(jsonString);


List<GetParagraphArea> getParagraphAreaFromJson(String str) => List<GetParagraphArea>.from(json.decode(str).map((x) => GetParagraphArea.fromJson(x)));

String getParagraphAreaToJson(List<GetParagraphArea> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetParagraphArea {
    int? id;
    int? topicAreaId;
    String? paragraphTitle;
    String? content;
    String? example;
    DateTime? dateCreated;
    DateTime? dateUbdated;

    GetParagraphArea({
        this.id,
        this.topicAreaId,
        this.paragraphTitle,
        this.content,
        this.example,
        this.dateCreated,
        this.dateUbdated,
    });

    GetParagraphArea copyWith({
        int? id,
        int? topicAreaId,
        String? paragraphTitle,
        String? content,
        String? example,
        DateTime? dateCreated,
        DateTime? dateUbdated,
    }) => 
        GetParagraphArea(
            id: id ?? this.id,
            topicAreaId: topicAreaId ?? this.topicAreaId,
            paragraphTitle: paragraphTitle ?? this.paragraphTitle,
            content: content ?? this.content,
            example: example ?? this.example,
            dateCreated: dateCreated ?? this.dateCreated,
            dateUbdated: dateUbdated ?? this.dateUbdated,
        );

    factory GetParagraphArea.fromJson(Map<String, dynamic> json) => GetParagraphArea(
        id: json["id"],
        topicAreaId: json["topic_area_id"],
        paragraphTitle: json["paragraph_title"],
        content: json["content"],
        example: json["example"],
        dateCreated: json["date_created"] == null ? null : DateTime.parse(json["date_created"]),
        dateUbdated: json["date_ubdated"] == null ? null : DateTime.parse(json["date_ubdated"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "topic_area_id": topicAreaId,
        "paragraph_title": paragraphTitle,
        "content": content,
        "example": example,
        "date_created": "${dateCreated!.year.toString().padLeft(4, '0')}-${dateCreated!.month.toString().padLeft(2, '0')}-${dateCreated!.day.toString().padLeft(2, '0')}",
        "date_ubdated": "${dateUbdated!.year.toString().padLeft(4, '0')}-${dateUbdated!.month.toString().padLeft(2, '0')}-${dateUbdated!.day.toString().padLeft(2, '0')}",
    };
}
