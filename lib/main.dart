import 'package:flutter/material.dart';
import 'package:graduation_project_flutter/views/faculty/main_page.dart';
import 'package:graduation_project_flutter/views/student/main_page.dart';

void main() {
  bool isStudent = true;
  runApp(MyApp(isStudent: isStudent));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isStudent});
  final bool isStudent;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Profile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: isStudent ? const StudentMainPage() : const AdminMainPage(),
    );
  }
}
