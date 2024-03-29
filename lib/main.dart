import 'package:flutter/material.dart';
import 'package:graduation_project_flutter/views/authentication/registration_page.dart';
import 'package:graduation_project_flutter/views/authentication/signin_page.dart';
import 'package:graduation_project_flutter/views/faculty/main_page.dart';
import 'package:graduation_project_flutter/views/student/home_page.dart';
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
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: RegistrationPage(),
        // isStudent ? const StudentMainPage() : const AdminMainPage(),
        routes: {
          "student_main_page": (context) => const StudentMainPage(),
          "home_page": (context) => const HomePage(),
        });
  }
}
