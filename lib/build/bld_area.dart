
import 'package:flutter/material.dart';
import 'package:graduation_project_flutter/widgets/glass_card.dart';

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
