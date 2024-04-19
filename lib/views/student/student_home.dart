import 'package:flutter/material.dart';
import 'package:graduation_project_flutter/controllers/api_service.dart';
import 'package:graduation_project_flutter/models/area.dart';
import 'package:graduation_project_flutter/models/event.dart';
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

              // First tab content
              NetworkAwareWidget<List<dynamic>>(
                fetchData: apiService.getAreaData, // The API call function
                dataBuilder: (context, data) => buildAreaList(context, data), // The UI builder function
              ),
              
              // Second tab content
              buildEventTab(),
            ],
          ),
        ),
      ),
    );
  }
}

