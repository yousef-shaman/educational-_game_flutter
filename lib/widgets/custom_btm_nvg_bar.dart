import 'package:flutter/material.dart';
import 'package:graduation_project_flutter/views/faculty/admin_notifications.dart';
import 'package:graduation_project_flutter/views/faculty/admin_home.dart';
import 'package:graduation_project_flutter/views/faculty/admin_profile.dart';
import 'package:graduation_project_flutter/views/student/student_home.dart';
import 'package:graduation_project_flutter/views/student/leaderboard.dart';
import 'package:graduation_project_flutter/views/student/student_profile.dart';

class CustomBtmNvgBar extends StatefulWidget {
  const CustomBtmNvgBar({
    super.key,
  });

  @override
  State<CustomBtmNvgBar> createState() => _CustomBtmNvgBarState();
}

class _CustomBtmNvgBarState extends State<CustomBtmNvgBar> {
  int _currentIndex = 0;
  late CustomBtmNvgBar tabpages;
  bool isStudent = false;

  List<Widget> studentnavbar = <Widget>[
    const StudentProfile(),
    const StudentHome(),
    const Leaderboard(),
  ];

  List<Widget> adminnavbar = <Widget>[
    const AdminProfilePage(),
    const AdminHome(),
    AdminNotifications(),
  ];

  
  @override
  Widget build(BuildContext context) {
    if (isStudent) {
      return Scaffold(
        extendBody: true,
        bottomNavigationBar: Container(
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 15),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(100.0)),
            child: BottomNavigationBar(
              showUnselectedLabels: false, // This hides labels for unselected items
              showSelectedLabels: true, // This shows the label for the selected item
              // backgroundColor: const Color(0xffFAF2E1),
              unselectedItemColor: const Color(0xffD6CEC0),

              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline_rounded),
                  label: "Profile",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.gesture_rounded),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.leaderboard_rounded),
                  label: "Leaderboard",
                ),
              ],
            ),
          ),
        ),
        body: studentnavbar.elementAt(_currentIndex),
      );
    }
    else {
      return Scaffold(
        extendBody: true,
        bottomNavigationBar: Container(
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 15),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(100.0)),
            child: BottomNavigationBar(
              showUnselectedLabels: false, // This hides labels for unselected items
              showSelectedLabels: true, // This shows the label for the selected item
              // backgroundColor: const Color(0xffFFFFFF),
              unselectedItemColor: const Color(0xffD6CEC0),
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline_rounded),
                  label: 'Profile',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.gesture_rounded),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.notifications_none_rounded),
                  label: "Notification",
                ),
              ],
            ),
          ),
        ),
        body: adminnavbar.elementAt(_currentIndex),
      );
    }
  }
}
