import 'package:flutter/material.dart';
import 'package:graduation_project_flutter/constants.dart';
import 'package:graduation_project_flutter/views/student/student_settings.dart';
import 'package:graduation_project_flutter/widgets/gradient_scaffold.dart';
import 'package:graduation_project_flutter/widgets/grid_view.dart';
import 'package:graduation_project_flutter/widgets/progresbar.dart';

class StudentProfile extends StatefulWidget {
  const StudentProfile({super.key});

  @override
  State<StudentProfile> createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {
  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      body: ListView(
        children: [
          // First part
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 24),
                // Assuming _buildProfileCard is defined elsewhere
                _buildProfileCard(context),
              ],
            ),
          ),

          // Second part
          const Center(child: Text('PERFORMANCE', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold))),
          const Padding(
            padding: EdgeInsets.all(25.0),
            child: CustomGridB(),
          ),
        ],
      ),
    );
  }




  Widget _buildProfileCard(BuildContext context) {
    late double percentange = 0.3;
    return Column(
      children: [

        //Frist part
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Student Profile', style: labelSmall),
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const StudentSettings()));
                },
                icon: const Icon(Icons.settings, color: Color(0xff191923))),
          ],
        ),

        const SizedBox(height: 24),

        //Second part
        Column(
          children: [
            const CircleAvatar(
              radius: 48,
              backgroundImage: AssetImage("images/man_4140048.png"),
            ),
            const SizedBox(height: 15),
            const Text('SOMEONE OUTSIDER', style: labelMediem),
            const SizedBox(height: 15),
            CustomProgresBar(
              width: 200,
              height: 25,
              progres: percentange,
            ),
            const SizedBox(height: 10),
            const Text('To the next level', style: labelElse),
          ],
        ),
      ],
    );
  }
}
