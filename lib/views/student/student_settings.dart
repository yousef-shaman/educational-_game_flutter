import 'package:flutter/material.dart';
import 'package:graduation_project_flutter/widgets/gradient_scaffold.dart';
// import 'package:get/get.dart';

class StudentSettings extends StatefulWidget {
  const StudentSettings({super.key,});

@override
 State<StudentSettings> createState() => _StudentSettingsState();

  
  } 

class _StudentSettingsState extends State<StudentSettings>{

  @override
    Widget build(BuildContext context) {

      return GradientScaffold(
      appBar: AppBar(title: const Text('Settings'),
      elevation: 0,),

      body: const Scaffold (),

      );
    }
}