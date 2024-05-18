// To parse this JSON data, do
//
//     final optionsArea = optionsAreaFromJson(jsonString);

import 'dart:convert';

PostOptionsArea optionsAreaFromJson(String str) => PostOptionsArea.fromJson(json.decode(str));

String optionsAreaToJson(PostOptionsArea data) => json.encode(data.toJson());

class PostOptionsArea {
    int? questionsAreaId;
    String? optionSyntax;
    bool? isCorrect;

    PostOptionsArea({
        this.questionsAreaId,
        this.optionSyntax,
        this.isCorrect,
    });

    PostOptionsArea copyWith({
        int? questionsAreaId,
        String? optionSyntax,
        bool? isCorrect,
    }) => 
        PostOptionsArea(
            questionsAreaId: questionsAreaId ?? this.questionsAreaId,
            optionSyntax: optionSyntax ?? this.optionSyntax,
            isCorrect: isCorrect ?? this.isCorrect,
        );

    factory PostOptionsArea.fromJson(Map<String, dynamic> json) => PostOptionsArea(
        questionsAreaId: json["questions_area_id"],
        optionSyntax: json["option_syntax"],
        isCorrect: json["is_correct"],
    );

    Map<String, dynamic> toJson() => {
        "questions_area_id": questionsAreaId,
        "option_syntax": optionSyntax,
        "is_correct": isCorrect,
    };
}

// To parse this JSON data, do
//
//     final getOptionsArea = getOptionsAreaFromJson(jsonString);


List<GetOptionsArea> getOptionsAreaFromJson(String str) => List<GetOptionsArea>.from(json.decode(str).map((x) => GetOptionsArea.fromJson(x)));

String getOptionsAreaToJson(List<GetOptionsArea> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetOptionsArea {
    int? id;
    int? questionsAreaId;
    String? optionSyntax;
    bool? isCorrect;
    DateTime? dateCreated;
    DateTime? dateUbdated;

    GetOptionsArea({
        this.id,
        this.questionsAreaId,
        this.optionSyntax,
        this.isCorrect,
        this.dateCreated,
        this.dateUbdated,
    });

    GetOptionsArea copyWith({
        int? id,
        int? questionsAreaId,
        String? optionSyntax,
        bool? isCorrect,
        DateTime? dateCreated,
        DateTime? dateUbdated,
    }) => 
        GetOptionsArea(
            id: id ?? this.id,
            questionsAreaId: questionsAreaId ?? this.questionsAreaId,
            optionSyntax: optionSyntax ?? this.optionSyntax,
            isCorrect: isCorrect ?? this.isCorrect,
            dateCreated: dateCreated ?? this.dateCreated,
            dateUbdated: dateUbdated ?? this.dateUbdated,
        );

    factory GetOptionsArea.fromJson(Map<String, dynamic> json) => GetOptionsArea(
        id: json["id"],
        questionsAreaId: json["questions_area_id"],
        optionSyntax: json["option_syntax"],
        isCorrect: json["is_correct"],
        dateCreated: json["date_created"] == null ? null : DateTime.parse(json["date_created"]),
        dateUbdated: json["date_ubdated"] == null ? null : DateTime.parse(json["date_ubdated"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "questions_area_id": questionsAreaId,
        "option_syntax": optionSyntax,
        "is_correct": isCorrect,
        "date_created": "${dateCreated!.year.toString().padLeft(4, '0')}-${dateCreated!.month.toString().padLeft(2, '0')}-${dateCreated!.day.toString().padLeft(2, '0')}",
        "date_ubdated": "${dateUbdated!.year.toString().padLeft(4, '0')}-${dateUbdated!.month.toString().padLeft(2, '0')}-${dateUbdated!.day.toString().padLeft(2, '0')}",
    };
}

