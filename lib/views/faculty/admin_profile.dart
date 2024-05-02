import 'package:flutter/material.dart';
import 'package:graduation_project_flutter/views/student/student_settings.dart';
import 'package:graduation_project_flutter/widgets/custom_glass_card.dart';
import 'package:graduation_project_flutter/widgets/custom_gradient_scaffold.dart';

class AdminProfilePage extends StatefulWidget {
  const AdminProfilePage({super.key});

  @override
  State<AdminProfilePage> createState() => _AdminProfilePageState();
}

class _AdminProfilePageState extends State<AdminProfilePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      body: ListView(
        children: [
          //Frist part
          CustomGlassCard(
            width: 250,
            // padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.all(10),
            borderRadius: BorderRadius.circular(20),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 5, 24, 24),
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

          //Second part
          SizedBox(
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
                  toolbarHeight:
                      30, // Adjusted to give enough space for the tabs
                  bottom: const TabBar(
                    labelStyle:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    unselectedLabelStyle:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
                    tabs: [
                      Tab(child: Text("Data")),
                      Tab(child: Text("Massar")),
                    ],
                  ),
                ),
                body: const TabBarView(
                  children: [
                    // First tab content
                    Center(
                      child: Text(
                        "Data",
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
                        "Massar",
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
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Admin Profile', style: TextStyle(color: Color(0xff191923))),
        IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const StudentSettings()));
            },
            icon: const Icon(Icons.settings, color: Color(0xff191923))),
      ],
    );
  }

  Widget _buildProfileImage(BuildContext context) {
    return const Column(
      children: [
        CircleAvatar(
          radius: 48,
          backgroundImage: AssetImage("images/man_4139993.png"),
        ),
        SizedBox(height: 15),
        Text('somebody insider',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Color(0xff191923))),
      ],
    );
  }
}
