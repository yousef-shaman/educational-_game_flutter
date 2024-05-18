import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graduation_project_flutter/widgets/btm_nvg_bar.dart';
import 'constants/colors.dart';
import 'forms/area_form.dart';
import 'undefined_route.dart';
import 'utilities/local_storge.dart';
import 'views/authentication/signin_page.dart';
import 'forms/add_topic.dart';
import 'views/screen/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeGlobals(); // Initialize global variables
  // Optional: Set preferred orientations
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
    .then((_) {
      runApp(const MyApp());
    });
}

// Initialize global variables
Future<void> initializeGlobals() async {
  await getData('role');  // This will update the global userRole variable
}

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
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // App Themes
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff0e79b2))
            .copyWith(background: const Color(0xffFFFFFF)),
        primaryColor: const Color(0xffFFFFFF),
        scaffoldBackgroundColor: Colors.transparent,
        fontFamily: 'DejaVu Sans',
        brightness: Brightness.light,

        // BottomNavigationBar Theme
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xffFFFFFF),
          selectedIconTheme: IconThemeData(
            color: Color(0xff0e79b2),
            size: 30,
          ),
          selectedLabelStyle:
              TextStyle(color: Color(0xff0e79b2), fontWeight: FontWeight.bold),
        ),

        // AppBar Theme
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          toolbarHeight: 70,
          iconTheme: IconThemeData(color: Color(0xff191923)),
          elevation: 0.0,
          titleTextStyle: TextStyle(
            color: Color(0xff191923),
            fontWeight: FontWeight.bold,
            fontSize: 23,
          ),
        ),

        // TabBar Theme
        tabBarTheme: const TabBarTheme(
          // dividerHeight: 200,
          labelColor: Colors.black, // Color of the text for selected tabs
          unselectedLabelColor: Colors.grey, // Color of the text for unselected tabs
          indicator: BoxDecoration(
            border: Border(bottom: BorderSide.none),
          ),
          labelStyle: TextStyle(
            fontSize: 20.0,
            wordSpacing: 10, // Size of the text for selected tabs
            fontWeight: FontWeight.w900, // Weight of the text for selected tabs
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 16.0, // Size of the text for unselected tabs
          ),
        ),

        // List Tile Theme
        listTileTheme: const ListTileThemeData(
          contentPadding: EdgeInsets.all(15),
          textColor: Color.fromARGB(255, 0, 0, 0),
          style: ListTileStyle.list,
        ),

        // Elevated Button Theme
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            foregroundColor: const MaterialStatePropertyAll(Color(0xff00798c)),
            backgroundColor: const MaterialStatePropertyAll(Color(0xffFAF2E1)),
            padding: const MaterialStatePropertyAll(
                EdgeInsets.symmetric(vertical: 16.0)),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        ),
      ),
      // End App Themes

      home: FutureBuilder<bool>(
        future: isLoggedIn(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(); // or some splash screen
          } else {
            if (snapshot.hasError) {
              return const Text('Error: Could not determine login status');
            } else {
              // Check if logged in
              return snapshot.data! ? const CustomBtmNvgBar() : const SignInPage();
            }
          }
        },
      ),

      routes: {
        // Staff pages
        "add_area": (context) => const AreaForm(),
        // "add_event": (context) => const AddEvent(),
        "add_topic": (context) => const AddTopic(),

        // Student pages
        "home_page": (context) => const Homepage(),
      },
      onUnknownRoute: (settings) {
        // This is for any routes that are not defined, acting as a "catch-all" for routes
        return MaterialPageRoute(
            builder: (context) => const UndefinedRoutePage());
      },
    );
  }
}
