// To parse this JSON data, do
//
//     final event = eventFromJson(jsonString);

import 'dart:convert';

Event eventFromJson(String str) => Event.fromJson(json.decode(str));

String eventToJson(Event data) => json.encode(data.toJson());

class Event {
    String? eventName;
    String? description;
    bool? isActive;
    DateTime? dateStart;
    DateTime? dateEnd;

    Event({
        this.eventName,
        this.description,
        this.isActive,
        this.dateStart,
        this.dateEnd,
    });

    Event copyWith({
        String? eventName,
        String? description,
        bool? isActive,
        DateTime? dateStart,
        DateTime? dateEnd,
    }) => 
        Event(
            eventName: eventName ?? this.eventName,
            description: description ?? this.description,
            isActive: isActive ?? this.isActive,
            dateStart: dateStart ?? this.dateStart,
            dateEnd: dateEnd ?? this.dateEnd,
        );

    factory Event.fromJson(Map<String, dynamic> json) => Event(
        eventName: json["event_name"],
        description: json["description"],
        isActive: json["is_active"],
        dateStart: json["date_start"] == null ? null : DateTime.parse(json["date_start"]),
        dateEnd: json["date_end"] == null ? null : DateTime.parse(json["date_end"]),
    );

    Map<String, dynamic> toJson() => {
        "event_name": eventName,
        "description": description,
        "is_active": isActive,
        "date_start": dateStart?.toIso8601String(),
        "date_end": dateEnd?.toIso8601String(),
    };
}

