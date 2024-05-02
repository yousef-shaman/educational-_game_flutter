// To parse this JSON data, do
//
//     final optionsArea = optionsAreaFromJson(jsonString);

import 'dart:convert';

OptionsArea optionsAreaFromJson(String str) => OptionsArea.fromJson(json.decode(str));

String optionsAreaToJson(OptionsArea data) => json.encode(data.toJson());

class OptionsArea {
    String? optionSyntax;
    bool? isCorrect;

    OptionsArea({
        this.optionSyntax,
        this.isCorrect,
    });

    OptionsArea copyWith({
        String? optionSyntax,
        bool? isCorrect,
    }) => 
        OptionsArea(
            optionSyntax: optionSyntax ?? this.optionSyntax,
            isCorrect: isCorrect ?? this.isCorrect,
        );

    factory OptionsArea.fromJson(Map<String, dynamic> json) => OptionsArea(
        optionSyntax: json["option_syntax"],
        isCorrect: json["is_correct"],
    );

    Map<String, dynamic> toJson() => {
        "option_syntax": optionSyntax,
        "is_correct": isCorrect,
    };
}


//---------------------------------------------------------

// To parse this JSON data, do
//
//     final optionsEvent = optionsEventFromJson(jsonString);


OptionsEvent optionsEventFromJson(String str) => OptionsEvent.fromJson(json.decode(str));

String optionsEventToJson(OptionsEvent data) => json.encode(data.toJson());

class OptionsEvent {
    String? optionSyntax;
    bool? isCorrect;

    OptionsEvent({
        this.optionSyntax,
        this.isCorrect,
    });

    OptionsEvent copyWith({
        String? optionSyntax,
        bool? isCorrect,
    }) => 
        OptionsEvent(
            optionSyntax: optionSyntax ?? this.optionSyntax,
            isCorrect: isCorrect ?? this.isCorrect,
        );

    factory OptionsEvent.fromJson(Map<String, dynamic> json) => OptionsEvent(
        optionSyntax: json["option_syntax"],
        isCorrect: json["is_correct"],
    );

    Map<String, dynamic> toJson() => {
        "option_syntax": optionSyntax,
        "is_correct": isCorrect,
    };
}
