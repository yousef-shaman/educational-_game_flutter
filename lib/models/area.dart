// To parse this JSON data, do
//
//     final area = areaFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:graduation_project_flutter/widgets/custom_glass_card.dart';


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


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Widget buildAreaList(BuildContext context, List<dynamic> data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, i) {
        var areaData = data[i];
        return InkWell(
            onTap: () {
              // isStudent ? Navigator.of(context).push(MaterialPageRoute(
              //     builder: (context) =>  StudentViewer(
              //           dataOfTopics: areaData, 
              //         ))) : Navigator.of(context).push(MaterialPageRoute(
              //     builder: (context) => AdminViewer( dataOfTopics: areaData,)));
            },
            child: CustomGlassCard(
              margin: const EdgeInsets.all(15),
              borderRadius: BorderRadius.circular(20),
              height: 150,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  areaData["title"] ?? 'Untitled Area',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
            ));
      },
    );
  }

