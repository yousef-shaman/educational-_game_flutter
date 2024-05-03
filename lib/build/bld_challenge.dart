
import 'package:flutter/material.dart';
import 'package:graduation_project_flutter/widgets/glass_card.dart';

class ChallingesBuilder {

  Widget buildEasyChallinge(BuildContext context, {Map? dataOfTopics}) {
    
    if (dataOfTopics == null) {
      return const Center(
          child: Text("No data provided.",
              style: TextStyle(
                  color: Color(0xff191923),
                  fontSize: 18,
                  fontWeight: FontWeight.w600)));
    }
    return InkWell(
      onTap: () {
        // Navigator.of(context).push(MaterialPageRoute(
        //           builder: (context) => const QyestionViewer()));
      },
      child: CustomGlassCard(
            margin: const EdgeInsets.all(15),
            height: 150,
            width: 150,
            borderRadius: BorderRadius.circular(400),
            child: const Center(
              child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Icon(Icons.hive, color: Colors.greenAccent, size: 100,)
                  
                  // Text(
                  //   dataOfTopics["title"] ?? "No Title",
                  //   style: const TextStyle(
                  //       color: Color(0xff191923),
                  //       fontSize: 18,
                  //       fontWeight: FontWeight.w600),
                  // ),
                ),
            ),),
    );
  } 


  Widget buildMediumChallinge(BuildContext context, {Map? dataOfTopics}) {
    
    if (dataOfTopics == null) {
      return const Center(
          child: Text("No data provided.",
              style: TextStyle(
                  color: Color(0xff191923),
                  fontSize: 18,
                  fontWeight: FontWeight.w600)));
    }
    return InkWell(
      onTap: () {
        
      },
      child: CustomGlassCard(
            margin: const EdgeInsets.all(15),
            height: 150,
            width: 150,
            borderRadius: BorderRadius.circular(400),
            child: const Center(
              child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Icon(Icons.mode_standby_outlined, color: Colors.orangeAccent, size: 100,)
                  
                  // Text(
                  //   dataOfTopics["title"] ?? "No Title",
                  //   style: const TextStyle(
                  //       color: Color(0xff191923),
                  //       fontSize: 18,
                  //       fontWeight: FontWeight.w600),
                  // ),
                ),
            ),),
    );
  }

  Widget buildHardChallinge(BuildContext context, {Map? dataOfTopics}) {
    
    if (dataOfTopics == null) {
      return const Center(
          child: Text("No data provided.",
              style: TextStyle(
                  color: Color(0xff191923),
                  fontSize: 18,
                  fontWeight: FontWeight.w600)));
    }
    return InkWell(
      onTap: () {
        
      },
      child: CustomGlassCard(
            margin: const EdgeInsets.all(15),
            height: 150,
            width: 150,
            borderRadius: BorderRadius.circular(400),
            child: const Center(
              child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Icon(Icons.local_fire_department, color: Colors.redAccent, size: 100,)
                  
                  // Text(
                  //   dataOfTopics["title"] ?? "No Title",
                  //   style: const TextStyle(
                  //       color: Color(0xff191923),
                  //       fontSize: 18,
                  //       fontWeight: FontWeight.w600),
                  // ),
                ),
            ),),
    );
  }
}