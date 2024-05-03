
// To parse this JSON data, do
//
// final optionsEvent = optionsEventFromJson(jsonString);


import 'dart:convert';

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