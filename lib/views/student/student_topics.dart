import 'package:flutter/material.dart';
import 'package:graduation_project_flutter/controllers/api_service.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:graduation_project_flutter/models/area.dart';
import 'package:graduation_project_flutter/widgets/custom_gradient_scaffold.dart';
import 'package:graduation_project_flutter/widgets/custom_network_aware.dart';
import 'package:graduation_project_flutter/widgets/custom_speed_dial.dart';

class StudentTopics extends StatefulWidget {
  const StudentTopics({super.key});

  @override
  State<StudentTopics> createState() => _StudentTopicsState();
}

class _StudentTopicsState extends State<StudentTopics> {
  final APIService apiService = APIService();

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          extendBody: true,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniEndFloat,
          floatingActionButton: Container(
              padding: const EdgeInsets.only(bottom: 80, right: 10),
              child: CustomSpeedDial(
                animatedIcon: AnimatedIcons.menu_close,
                backgroundColor: Colors.amberAccent,
                children: [
                  SpeedDialChild(
                    child: const Icon(Icons.area_chart_rounded),
                    label: 'Add Area',
                    onTap: () => Navigator.pushNamed(context, "add_area"),
                  ),
                  SpeedDialChild(
                    child: const Icon(Icons.emoji_events_rounded),
                    label: 'Add Event',
                    onTap: () => Navigator.pushNamed(context, "add_event"),
                  ),
                ],
              )),
          body: ListView(
            children: [
              // First tab content
              NetworkAwareWidget<List<dynamic>>(
                fetchData: apiService.getAreaData, // The API call function
                dataBuilder: (context, data) =>
                    buildAreaList(context, data), // The UI builder function
              ),

              // Second tab content
            ],
          ),
        ),
      ),
    );
  }
}
