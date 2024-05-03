import 'package:flutter/material.dart';
import 'package:graduation_project_flutter/constants.dart';

class CustomProgresBar extends StatelessWidget {
  final double width;
  final double height;
  final double progres;
  const CustomProgresBar(
      {super.key,
      required this.width,
      required this.height,
      required this.progres});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Container(
            width: width * progres,
            height: height,
            decoration: BoxDecoration(
              color: Colors.blue[300],
              borderRadius: BorderRadius.circular(10),
            ),
          ),

          Align(
            alignment: Alignment.center,
            child: Text('${(progres*100).toInt()}%', style: labelElse,),
          )
        ],
      ),
    );
  }
}
