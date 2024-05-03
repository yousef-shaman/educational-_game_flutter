
// To parse this JSON data, do
//
// final paragraphEvent = paragraphEventFromJson(jsonString);


import 'dart:convert';

ParagraphEvent paragraphEventFromJson(String str) => ParagraphEvent.fromJson(json.decode(str));

String paragraphEventToJson(ParagraphEvent data) => json.encode(data.toJson());

class ParagraphEvent {
    String? paragraphTitle;
    String? content;
    String? example;

    ParagraphEvent({
        this.paragraphTitle,
        this.content,
        this.example,
    });

    ParagraphEvent copyWith({
        String? paragraphTitle,
        String? content,
        String? example,
    }) => 
        ParagraphEvent(
            paragraphTitle: paragraphTitle ?? this.paragraphTitle,
            content: content ?? this.content,
            example: example ?? this.example,
        );

    factory ParagraphEvent.fromJson(Map<String, dynamic> json) => ParagraphEvent(
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