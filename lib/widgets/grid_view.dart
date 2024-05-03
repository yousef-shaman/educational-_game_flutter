import 'package:flutter/material.dart';
import 'package:graduation_project_flutter/constants.dart';

class CustomGridB extends StatelessWidget {
  const CustomGridB({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 25,
        crossAxisSpacing: 25,
      ),
      
        children: [
          Column(
            children: [
              const Center(child: Text('LEVEL', style: labelHuge),),
              Container(
              // height: 150,
              // width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blueAccent.withOpacity(0.3),
              ),
              child: const Center(child: Text('1', style: labelHuge),),
                      ),
            ],
          ),

       Column(
            children: [
              const Center(child: Text('POINT', style: labelHuge),),
              Container(
              // height: 150,
              // width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blueAccent.withOpacity(0.3),
              ),
              child: const Center(child: Text('78', style: labelHuge),),
                      ),
            ],
          ),
        ],
    );
  }
}
