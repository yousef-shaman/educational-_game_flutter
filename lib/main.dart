import 'package:flutter/material.dart';
import 'package:graduation_project_flutter/views/faculty/main_page.dart';
import 'package:graduation_project_flutter/views/student/home_page.dart';
import 'package:graduation_project_flutter/widgets/custom_tab_bar.dart';

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
        theme: ThemeData(
          // scaffoldBackgroundColor: Color.fromARGB(255, 138, 67, 67),
          fontFamily: 'Montserrat',
          brightness: Brightness.light,
          appBarTheme: const AppBarTheme(
              color: Color(0xffFAF2E1),
              titleTextStyle: TextStyle(
                  color: Color(0xff403A3A),
                  fontWeight: FontWeight.bold,
                  fontSize: 20)),

          tabBarTheme: const TabBarTheme(
            
            labelColor: Color(0xff00798c), // Color of the text for selected tabs
            // unselectedLabelColor:
            //     Colors.grey, // Color of the text for unselected tabs
            indicator: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color(0xff00798c), // Color of the indicator.
                  width: 3.0, // Thickness of the bottom border.
                ),
              ),
            ),
            labelStyle: TextStyle(
              fontSize: 18.0, // Size of the text for selected tabs
              fontWeight:
                  FontWeight.bold, // Weight of the text for selected tabs
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 16.0, // Size of the text for unselected tabs
            ),
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff00798c))
              .copyWith(background: const Color(0xff403A3A)),
        ),
        home: isStudent ? const CustomTabBar() : const AdminMainPage(),
        // RegistrationPage(),
        routes: {
          "home_page": (context) => const HomePage(),
        });
  }
}
