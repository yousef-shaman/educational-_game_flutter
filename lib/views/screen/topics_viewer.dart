import 'package:flutter/material.dart';
import 'package:graduation_project_flutter/models/area/ar_topic.dart';
import 'package:graduation_project_flutter/services/area_api/ar_topic_service.dart';
import 'package:graduation_project_flutter/widgets/gradient_scaffold.dart';
import 'package:graduation_project_flutter/widgets/network_aware.dart';
import 'package:graduation_project_flutter/widgets/speed_dial.dart';
import '../../build/bld_topic.dart';
import '../../utilities/permissions.dart';

class TopicsViewer extends StatefulWidget {
  final int areaId;
  final String areaName;

  const TopicsViewer({super.key, required this.areaId, required this.areaName});

  @override
  State<TopicsViewer> createState() => _TopicsViewerState();
}

class _TopicsViewerState extends State<TopicsViewer> {
  final topicAPI = ArTopicServiceAPI();

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      body: Scaffold(
        extendBody: true,
        appBar: AppBar(
          elevation: 0,
          // toolbarHeight: 30,
          title: Text(widget.areaName),
        ),
        floatingActionButtonLocation: isFacultyMember()
            ? FloatingActionButtonLocation.miniEndFloat
            : null,
        floatingActionButton: isFacultyMember()
            ? Container(
                padding: const EdgeInsets.only(bottom: 15, right: 10),
                child: CustomSpeedDial(
                  icon: Icons.add,
                  backgroundColor: Colors.amberAccent,
                  onTap: () => Navigator.pushNamed(context, "add_topic"),
                ),
              )
            : null,
        body: NetworkAwareWidget<List<GetTopicArea>>(
          fetchData: () => topicAPI.fetchTopic(widget.areaId),
          dataBuilder: (context, data) => TopicListWidget(data: data),
        ),
      ),
    );
  }
}
