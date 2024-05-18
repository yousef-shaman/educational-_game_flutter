import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project_flutter/views/screen/homepage.dart';
import 'package:graduation_project_flutter/views/screen/leaderboard.dart';
import 'package:graduation_project_flutter/views/screen/profile.dart';
import '../controllers/network_controller.dart';

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
  final NetworkController networkController = Get.put(NetworkController());

  @override
  void initState() {
    super.initState();
  }


  List<Widget> navbarTabs = <Widget>[
    const Profile(),
    const Homepage(),
    const Leaderboard(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 15),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(100.0)),
          child: BottomNavigationBar(
            showUnselectedLabels:
                false, // This hides labels for unselected items
            showSelectedLabels:
                true, // This shows the label for the selected item
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
      body: navbarTabs.elementAt(_currentIndex),
    );
  }
}
