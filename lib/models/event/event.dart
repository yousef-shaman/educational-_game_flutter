// To parse this JSON data, do
//
//     final event = eventFromJson(jsonString);

import 'dart:convert';

Event eventFromJson(String str) => Event.fromJson(json.decode(str));

String eventToJson(Event data) => json.encode(data.toJson());

class Event {
    int? adminProfile;
    int? facultyDepartment;
    String? eventName;
    String? description;
    bool? isActive;
    DateTime? dateStart;
    DateTime? dateEnd;

    Event({
        this.adminProfile,
        this.facultyDepartment,
        this.eventName,
        this.description,
        this.isActive,
        this.dateStart,
        this.dateEnd,
    });

    Event copyWith({
        int? adminProfile,
        int? facultyDepartment,
        String? eventName,
        String? description,
        bool? isActive,
        DateTime? dateStart,
        DateTime? dateEnd,
    }) => 
        Event(
            adminProfile: adminProfile ?? this.adminProfile,
            facultyDepartment: facultyDepartment ?? this.facultyDepartment,
            eventName: eventName ?? this.eventName,
            description: description ?? this.description,
            isActive: isActive ?? this.isActive,
            dateStart: dateStart ?? this.dateStart,
            dateEnd: dateEnd ?? this.dateEnd,
        );

    factory Event.fromJson(Map<String, dynamic> json) => Event(
        adminProfile: json["admin_profile"],
        facultyDepartment: json["faculty_department"],
        eventName: json["event_name"],
        description: json["description"],
        isActive: json["is_active"],
        dateStart: json["date_start"] == null ? null : DateTime.parse(json["date_start"]),
        dateEnd: json["date_end"] == null ? null : DateTime.parse(json["date_end"]),
    );

    Map<String, dynamic> toJson() => {
        "admin_profile": adminProfile,
        "faculty_department": facultyDepartment,
        "event_name": eventName,
        "description": description,
        "is_active": isActive,
        "date_start": dateStart?.toIso8601String(),
        "date_end": dateEnd?.toIso8601String(),
    };
}
