// To parse this JSON data, do
//
//     final optionsEvent = optionsEventFromJson(jsonString);

import 'dart:convert';

OptionsEvent optionsEventFromJson(String str) => OptionsEvent.fromJson(json.decode(str));

String optionsEventToJson(OptionsEvent data) => json.encode(data.toJson());

class OptionsEvent {
    int? questionsEventId;
    String? optionSyntax;
    bool? isCorrect;

    OptionsEvent({
        this.questionsEventId,
        this.optionSyntax,
        this.isCorrect,
    });

    OptionsEvent copyWith({
        int? questionsEventId,
        String? optionSyntax,
        bool? isCorrect,
    }) => 
        OptionsEvent(
            questionsEventId: questionsEventId ?? this.questionsEventId,
            optionSyntax: optionSyntax ?? this.optionSyntax,
            isCorrect: isCorrect ?? this.isCorrect,
        );

    factory OptionsEvent.fromJson(Map<String, dynamic> json) => OptionsEvent(
        questionsEventId: json["questions_event_id"],
        optionSyntax: json["option_syntax"],
        isCorrect: json["is_correct"],
    );

    Map<String, dynamic> toJson() => {
        "questions_event_id": questionsEventId,
        "option_syntax": optionSyntax,
        "is_correct": isCorrect,
    };
}
