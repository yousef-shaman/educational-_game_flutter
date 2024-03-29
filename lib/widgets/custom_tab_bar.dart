import 'package:flutter/material.dart';
import 'package:graduation_project_flutter/views/student/home_page.dart';
import 'package:graduation_project_flutter/views/student/leaderboard_page.dart';
import 'package:graduation_project_flutter/views/student/profile_page.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key});

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int _currentIndex = 0;

  List<Widget> listOption = <Widget>[
    const ProfilePage(),
    const HomePage(),
    const Leaderboard(),
  ];

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 15,
      ),
      extendBody: true,
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(15,10,15,15),
        // decoration: const BoxDecoration(
        //   borderRadius: BorderRadius.all(Radius.circular(100.0)),
        //   // boxShadow: [
        //   //   BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
        //   // ],
        // ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(100.0)
            // topLeft: Radius.circular(50.0),
            // topRight: Radius.circular(50.0),
            // bottomLeft: Radius.circular(50.0),
            // bottomRight: Radius.circular(50.0)
          ),
          child: BottomNavigationBar(
            
            backgroundColor: const Color(0xffFAF2E1),
            unselectedItemColor: const Color(0xffD6CEC0),

            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.person_rounded),
                label: "Profile",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.light_rounded),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.leaderboard_rounded),
                label: "Leaderb oard",
              ),
            ],
          ),
        ),
      ),
      body: listOption.elementAt(_currentIndex),
    );
  }
}
