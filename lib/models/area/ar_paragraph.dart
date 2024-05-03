// To parse this JSON data, do
//
//     final paragraphArea = paragraphAreaFromJson(jsonString);

import 'dart:convert';

ParagraphArea paragraphAreaFromJson(String str) => ParagraphArea.fromJson(json.decode(str));

String paragraphAreaToJson(ParagraphArea data) => json.encode(data.toJson());

class ParagraphArea {
    String? paragraphTitle;
    String? content;
    String? example;

    ParagraphArea({
        this.paragraphTitle,
        this.content,
        this.example,
    });

    ParagraphArea copyWith({
        String? paragraphTitle,
        String? content,
        String? example,
    }) => 
        ParagraphArea(
            paragraphTitle: paragraphTitle ?? this.paragraphTitle,
            content: content ?? this.content,
            example: example ?? this.example,
        );

    factory ParagraphArea.fromJson(Map<String, dynamic> json) => ParagraphArea(
        paragraphTitle: json["paragraph_title"],
        content: json["content"],
        example: json["example"],
    );

    Map<String, dynamic> toJson() => {
        "paragraph_title": paragraphTitle,
        "content": content,
        "example": example,
    };
}
