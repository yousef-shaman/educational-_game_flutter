import 'package:flutter/material.dart';
import 'package:graduation_project_flutter/views/student/settings_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Profile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const Profile(),
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Align(
        alignment: Alignment.topCenter,
        child: Card(
          margin: const EdgeInsets.all(10),
          color: Colors.grey[800],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24,5,24,24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildHeader(context),
                const SizedBox(height: 24),
                _buildProfileImage(context),
                const SizedBox(height: 24),

                // _buildProgressIndicator(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Student Profile -P', style: TextStyle(color: Colors.white70)),
        IconButton(onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SettingsPage()));
        }, icon: const Icon(Icons.settings, color: Colors.white70)),
      ],
    );
  }

  Widget _buildProfileImage(BuildContext context) {
    return const Column(
      children: [
        CircleAvatar(
          radius: 48,
          backgroundImage: AssetImage("images/man_4140048.png"),
        ),
        SizedBox(height: 15),
        Text('SOMEONE OUTSIDER', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
      ],
    );
  }

  // Widget _buildTabBar() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceAround,
  //     children: [
  //       _buildTab('Data'),
  //       _buildTab('Leaderboard'),
  //       _buildTab('Massr'),
  //     ],
  //   );
  // }

  // Widget _buildTab(String title) {
  //   return Text(title, style: const TextStyle(color: Colors.white70));
  // }

  // Widget _buildProgressIndicator() {
  //   return Row(
  //     children: [
  //       Container(
  //         width: 24,
  //         height: 24,
  //         decoration: BoxDecoration(
  //           color: Colors.blue[600],
  //           shape: BoxShape.circle,
  //         ),
  //         child: Center(
  //           child: Container(
  //             width: 16,
  //             height: 16,
  //             decoration: BoxDecoration(
  //               color: Colors.blue[400],
  //               shape: BoxShape.circle,
  //             ),
  //           ),
  //         ),
  //       ),
  //       Expanded(
  //         child: Container(
  //           height: 4,
  //           margin: EdgeInsets.only(left: 8),
  //           decoration: BoxDecoration(
  //             color: Colors.grey[700],
  //             borderRadius: BorderRadius.circular(2),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
