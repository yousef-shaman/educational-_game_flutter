import 'package:flutter/material.dart';
import 'package:graduation_project_flutter/constants.dart';
import 'package:graduation_project_flutter/undefined_route.dart';
import 'package:graduation_project_flutter/views/authentication/signin_page.dart';
import 'package:graduation_project_flutter/views/faculty/add_area.dart';
import 'package:graduation_project_flutter/views/faculty/add_event.dart';
import 'package:graduation_project_flutter/views/faculty/admin_notifications.dart';
import 'package:graduation_project_flutter/views/faculty/add_topic.dart';
import 'package:graduation_project_flutter/views/faculty/admin_home.dart';
import 'package:graduation_project_flutter/views/student/student_home.dart';
import 'package:graduation_project_flutter/views/student/student_viewer.dart';


void main() {
  runApp(const MyApp());
}

bool isStudent = false;
// Define a global variable for your gradient
const globalBackgroundGradient = BoxDecoration(
  gradient: LinearGradient(
    transform: GradientRotation(50),

    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [neutralA, neutralB], // Your gradient colors here
  ),
);
class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //APP THEMES
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff0e79b2))
            .copyWith(background: const Color(0xffFFFFFF)),
        primaryColor: const Color(0xffFFFFFF),
        scaffoldBackgroundColor: Colors.transparent,
        fontFamily: 'Montserrat',
        brightness: Brightness.light,
        
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor:  Color(0xffFFFFFF),
          selectedIconTheme: IconThemeData(color: Color(0xff0e79b2), size: 30,),
          selectedLabelStyle: TextStyle(color: Color(0xff0e79b2), fontWeight: FontWeight.bold),
        ),

        //AppBar Theme
        appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(color: Color(0xff191923)),
            elevation: 0.0,
            // backgroundColor: Colors.transparent,
            titleTextStyle: TextStyle(
                color: Color(0xff191923),
                fontWeight: FontWeight.bold,
                fontSize: 23)),

        //TabBar Theme
        tabBarTheme: const TabBarTheme(
          labelColor: Colors.black, // Color of the text for selected tabs
          unselectedLabelColor:
              Colors.grey, // Color of the text for unselected tabs
          indicator: BoxDecoration(
            border:
                Border(bottom: BorderSide(color: Colors.transparent, width: 0)),
          ),
          labelStyle: TextStyle(
            fontSize: 20.0, // Size of the text for selected tabs
            fontWeight: FontWeight.bold, // Weight of the text for selected tabs
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 18.0, // Size of the text for unselected tabs
          ),
        ),

        //Text Theme
        textTheme: const TextTheme(
            labelLarge: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
            displayLarge: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 26.0,
            )),

        //List Tile Theme
        listTileTheme: const ListTileThemeData(
          contentPadding: EdgeInsets.all(15),
          textColor: Color(0xffFAF2E1),
          style: ListTileStyle.list,
        ),

        //Elevated Button Theme
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                foregroundColor:
                    const MaterialStatePropertyAll(Color(0xff00798c)),
                backgroundColor:
                    const MaterialStatePropertyAll(Color(0xffFAF2E1)),
                padding: const MaterialStatePropertyAll(
                    EdgeInsets.symmetric(vertical: 16.0)),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ))),
      ),
      //END APP THEMES

      home:
          const SignInPage(),
          // const CustomBtmNvgBar(),
      routes: {
        //Admin pages
        "admin_home": (context) => const AdminHome(),
        "admin_notifications": (context) => AdminNotifications(),
        "add_area": (context) => const AddArea(),
        "add_event": (context) => const AddEvent(),
        "add_topic": (context) => const AddTopic(),

        //student pages
        "home_page": (context) => const StudentHome(),
        "viewer_page": (context) => const StudentViewer(),
      },
      onUnknownRoute: (settings) {
        // This is where you can handle any routes that are not defined
        // It's like a "catch-all" for routes
        return MaterialPageRoute(
            builder: (context) => const UndefinedRoutePage());
      },
    );
  }
}
