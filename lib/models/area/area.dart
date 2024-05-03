// To parse this JSON data, do
//
//     final area = areaFromJson(jsonString);

import 'dart:convert';


Area areaFromJson(String str) => Area.fromJson(json.decode(str));

String areaToJson(Area data) => json.encode(data.toJson());

class Area {
    String? areaName;
    String? description;
    bool? isActive;

    Area({
        this.areaName,
        this.description,
        this.isActive,
    });

    Area copyWith({
        String? areaName,
        String? description,
        bool? isActive,
    }) => 
        Area(
            areaName: areaName ?? this.areaName,
            description: description ?? this.description,
            isActive: isActive ?? this.isActive,
        );

    factory Area.fromJson(Map<String, dynamic> json) => Area(
        areaName: json["area_name"],
        description: json["description"],
        isActive: json["is_active"],
    );

    Map<String, dynamic> toJson() => {
        "area_name": areaName,
        "description": description,
        "is_active": isActive,
    };
}

