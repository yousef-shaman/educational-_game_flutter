import 'package:flutter/material.dart';
import 'package:graduation_project_flutter/build/bld_area.dart';
import 'package:graduation_project_flutter/build/bld_event.dart';
import 'package:graduation_project_flutter/services/area_api/area_service.dart';
import 'package:graduation_project_flutter/widgets/gradient_scaffold.dart';
import 'package:graduation_project_flutter/widgets/network_aware.dart';
import 'package:graduation_project_flutter/widgets/speed_dial.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import '../../models/area/area.dart';
import '../../utilities/permissions.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final areaAPI = AreaServiceAPI();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
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
          floatingActionButtonLocation: isSystemAdmin()
              ? FloatingActionButtonLocation.miniEndFloat
              : null,
          floatingActionButton: isSystemAdmin()
              ? Container(
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
                  ),
                )
              : null,
          body: TabBarView(
            children: [
              // First tab content
              NetworkAwareWidget<List<GetArea>>(
                fetchData: areaAPI.fetchArea, // Fetch data from the API
                dataBuilder: (context, data) {
                  // Printing the length of data received to debug and verify the fetch operation
                  print('Data received with length: ${data.length}');

                  // Filter data based on role
                  List<GetArea> filteredData = isStudent()
                      ? data.where((area) => area.isActive!).toList()
                      : data;

                  // Passing the fetched data directly to the AreaListWidget
                  return AreaListWidget(data: filteredData);
                },
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
