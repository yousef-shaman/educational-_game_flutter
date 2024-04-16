import 'package:flutter/material.dart';
import 'package:graduation_project_flutter/controllers/api_service.dart';
import 'package:graduation_project_flutter/views/student/student_viewer.dart';
import 'package:graduation_project_flutter/widgets/custom_glass_card.dart';
import 'package:graduation_project_flutter/widgets/custom_gradient_scaffold.dart';
import 'package:graduation_project_flutter/widgets/custom_network_aware.dart';


class StudentHome extends StatefulWidget {
  const StudentHome({super.key});

  @override
  State<StudentHome> createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  final APIService apiService = APIService();

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          extendBody: true,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            toolbarHeight: 30,
            bottom: const TabBar(
              tabs: [
                Tab(text: "Area"),
                Tab(text: "Event"),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              NetworkAwareWidget<List<dynamic>>(
                fetchData: apiService.getAreaData, // The API call function
                dataBuilder: (context, data) => buildAreaList(context, data), // The UI builder function
              ),
              buildEventTab(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAreaList(BuildContext context, List<dynamic> data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, i) {
        var areaData = data[i];
        return InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => StudentViewer(
                dataOfTopics: areaData,
              )));
          },
          child: CustomGlassCard(
              margin: const EdgeInsets.all(15),
              height: 150,
              content: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  areaData["title"] ?? 'Untitled Area',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
            )
        );
      },
    );
  }
  Widget buildEventTab() {
    // You can use a similar FutureBuilder pattern for events as well if needed
    return const Center(
      child: Text(
        "Events",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          fontSize: 25,
          color: Color(0xffFAF2E1),
        ),
      ),
    );
  }
}

