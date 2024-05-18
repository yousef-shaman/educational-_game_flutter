import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import '../../constants/globals.dart';
import '../../constants/text_style.dart';
import '../../models/user/student.dart';
import '../../services/user_service.dart';
import '../../utilities/jwt_decoder.dart';
import '../../utilities/permissions.dart';
import '../../widgets/gradient_scaffold.dart';
import '../../widgets/grid_view.dart';
import '../../widgets/progresbar.dart';
import '../../services/auth_service.dart';
import '../../utilities/local_storge.dart';
import '../authentication/signin_page.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int? _userId;
  String userName = 'Loading...'; // Default loading text
  String userEmail = '';
  String eduId = '';
  int studentLevel = 0;
  int studentPoints = 0;
  double studentGPA = 0.0;

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    // Retrieve access token from local storage
    String? token = await getData(accessToken);
    if (token != null) {
      // Decode user ID from token
      int userId = decodeToken(token);
      setState(() {
        _userId = userId;
        print("_userId : $_userId");
      });
      print("userId : $userId");

      // Fetch student data if the user is a student
      if (isStudent()) {
        fetchStudentData(userId);
      }
      // Add fetchAdminData or fetchFacultyData if needed
    } else {
      print("No token found, user is probably not logged in");
    }

    // Retrieve additional user information from local storage
    final fullName = await getData('fullName');
    final email = await getData('email');
    final eduId = await getData('eduId');

    setState(() {
      userName = fullName ?? 'Unknown';
      userEmail = email ?? 'No email';
      this.eduId = eduId ?? 'No EDU ID';
    });
  }

  void fetchStudentData(int userId) async {
    try {
      // Fetch student data from the API
      List<GetStudent> studentProfiles = await UserAPI().fetchStudentData(userId);
      if (studentProfiles.isNotEmpty) {
        GetStudent student = studentProfiles.first;
        setState(() {
          studentLevel = student.level ?? 0;
          studentPoints = student.earnedPoints ?? 0;
          studentGPA = student.gpa ?? 0.0;
          print("Assigned Level: $studentLevel, Points: $studentPoints, GPA: $studentGPA");
        });
      }
    } catch (e) {
      print("Error fetching student data: $e");
    }
  }

  Future<void> performLogout() async {
    // Retrieve refresh token from local storage
    String? refreshToken = await getData("refreshToken");
    print("refresh token $refreshToken");

    if (refreshToken != null) {
      // Log out user using the API
      bool loggedOut = await APIAuth().logout(refreshToken);
      if (loggedOut) {
        // Clear all local data related to the user session
        await clearAllData();
        if (mounted) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignInPage()));
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Failed to log out")));
        }
      }
    } else {
      print("No refresh token found, possibly already logged out");
    }
  }

  Future<void> clearAllData() async {
    // Clear all user-related data from local storage
    await clearData("accessToken");
    await clearData("refreshToken");
    await clearData("fullName");
    await clearData("email");
    await clearData("eduId");
    await clearData("role");
  }

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      body: ListView(
        children: [
          // First part: Profile Card
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 24),
                _buildProfileCard(context),
              ],
            ),
          ),

          // Second part: Dynamic Content based on Role
          if (isStudent()) ...[
            const Center(
              child: Text('PERFORMANCE',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: CustomGridB(
                level: studentLevel,
                points: studentPoints,
              ),
            ),
          ] else if (isSystemAdmin()) ...[
            _buildAdminTabs(),
          ] else if (isFacultyMember()) ...[
            // Implement the faculty member's specific UI
            const Center(child: Text('Faculty Member Profile Page')),
          ]
        ],
      ),
    );
  }

  Widget _buildProfileCard(BuildContext context) {
    late double percentage = (studentPoints).toDouble();
    return Card(
      elevation: 20,
      margin: const EdgeInsets.only(left: 10, right: 10),
      // color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
        child: Column(
          children: [
            // First part
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('$userRole Profile', style: labelSmall),
                IconButton(
                    onPressed: performLogout,
                    icon: const Icon(Icons.logout_rounded, color: Color(0xff191923))),
              ],
            ),
        
            // Second part
            Column(
              children: [
                CircleAvatar(
                  radius: 48,
                  backgroundColor: isStudent() ? Colors.amber : Colors.blueGrey,
                  // backgroundImage: AssetImage("images/man_4140048.png"),
                ),
                const SizedBox(height: 8),
                Text(userName,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height:8),
                Text(userEmail,
                    style: const TextStyle(fontSize: 16, color: Colors.grey)),
                // const SizedBox(height: 3),
                Text("Education ID: $eduId",
                    style: const TextStyle(fontSize: 16, color: Colors.grey)),
                if (isStudent()) ...[
                  const SizedBox(height: 20),
                  CustomProgresBar(
                    width: 200,
                    height: 25,
                    progres: percentage,
                  ),
                  const SizedBox(height: 10),
                  const Text('To the next level', style: labelElse),
                ]
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAdminTabs() {
    return SizedBox(
      height: 500, // Give a fixed height to the container
      child: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          extendBody: true,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            toolbarHeight: 30, // Adjusted to give enough space for the tabs
            bottom: const TabBar(
              labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              unselectedLabelStyle:
                  TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
              tabs: [
                Tab(child: Text("Student Data")),
                Tab(child: Text("Reports")),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              // First tab content
              Center(
                child: Text(
                  "Student Data",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff191923),
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 25,
                  ),
                ),
              ),
              // Second tab content
              Center(
                child: Text(
                  "Reports",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff191923),
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 25,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
