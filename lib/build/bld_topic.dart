
import 'package:flutter/material.dart';
import 'package:graduation_project_flutter/widgets/glass_card.dart';

class TopicBuilder {

  Widget buildTopicTab(BuildContext context, {Map? dataOfTopics}) {
    
    if (dataOfTopics == null) {
      return const Center(
          child: Text("No data provided.",
              style: TextStyle(
                  color: Color(0xff191923),
                  fontSize: 18,
                  fontWeight: FontWeight.w600)));
    }
    return ListView(
      children: [
        Container(
          margin: const EdgeInsets.all(20),
          child: Text(
            dataOfTopics["title"] ?? "No Title",
            style: const TextStyle(
                color: Color(0xff191923), fontSize: 22, fontWeight: FontWeight.w900),
          ),
        ),
        CustomGlassCard(
          margin: const EdgeInsets.all(15),
          borderRadius: BorderRadius.circular(20),
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                dataOfTopics["body"] ?? "No Content",
                style: const TextStyle(
                    color: Color(0xff191923),
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),)
      ],
    );
  }

  Widget buildExamplesTab(BuildContext context, {Map? dataOfTopics}) {
    
    if (dataOfTopics == null) {
      return const Center(
          child: Text("No data provided.",
              style: TextStyle(
                  color: Color(0xff191923),
                  fontSize: 18,
                  fontWeight: FontWeight.w600)));
    }
    return ListView(
      children: [
        Container(
          margin: const EdgeInsets.all(20),
          child: Text(
            dataOfTopics["title"] ?? "No Title",
            style: const TextStyle(
                color: Color(0xff0e79b2), fontSize: 22, fontWeight: FontWeight.w900),
          ),
        ),
        CustomGlassCard(
          margin: const EdgeInsets.all(15),
          borderRadius: BorderRadius.circular(20),
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                dataOfTopics["body"] ?? "No Content",
                style: const TextStyle(
                    color: Color(0xff0e79b2),
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),)
      ],
    );
  }
}