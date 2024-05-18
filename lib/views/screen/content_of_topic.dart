import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:graduation_project_flutter/services/area_api/ar_challenge_service.dart';
import 'package:graduation_project_flutter/services/area_api/ar_paragraph_service.dart';
import 'package:graduation_project_flutter/widgets/gradient_scaffold.dart';
import 'package:graduation_project_flutter/widgets/network_aware.dart';
import '../../build/bld_challenge.dart';
import '../../build/bld_paragraphs.dart';
import '../../models/area/ar_challenge.dart';
import '../../models/area/ar_paragraph.dart';
import '../../utilities/permissions.dart';
import '../../widgets/speed_dial.dart';

class ContentOfTopic extends StatefulWidget {
  final int topicId;
  final String topicName;

  const ContentOfTopic({super.key, required this.topicId, required this.topicName});

  @override
  State<ContentOfTopic> createState() => _ContentOfTopicState();
}

class _ContentOfTopicState extends State<ContentOfTopic> {
  final paragraphAPI = ArParagraphServiceAPI();
  final challengeAPI = ArChallengeServiceAPI();



  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: GradientScaffold(
        body: Scaffold(
          appBar: AppBar(
          title: Text(widget.topicName),
          bottom: const TabBar(
            tabs: [
              Tab(text: "Content"),
              Tab(text: "Examples"),
              Tab(text: "Challenges")
            ],
          ),
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
                  children: [
                    SpeedDialChild(
                      child: const Icon(Icons.add),
                      label: 'Add paragraph',
                      onTap: () => Navigator.pushNamed(context, "add_topic"),
                    ),
                    SpeedDialChild(
                      child: const Icon(Icons.add),
                      label: 'Add Challenge',
                      onTap: () => Navigator.pushNamed(context, "add_topic"),
                    ),
                  ],
                ),
              )
            : null,
          body: TabBarView(
            children: [
              // First tab content
              NetworkAwareWidget<List<GetParagraphArea>>(
                fetchData: () => paragraphAPI.fetchParagraph(widget.topicId),
                dataBuilder: (context, data) => ParagraphsWidget(data: data),
              ),
              // Second tab content
              NetworkAwareWidget<List<GetParagraphArea>>(
                fetchData: () => paragraphAPI.fetchParagraph(widget.topicId),
                dataBuilder: (context, data) => ExamplesWidget(data: data),
              ),
              // Third tab content
              NetworkAwareWidget<List<GetChallengeArea>>(
                fetchData: () => challengeAPI.fetchChallenge(widget.topicId),
                dataBuilder: (context, data) {
                  if (data.isEmpty) {
                    return const Center(
                      child: Text(
                        "No data provided.",
                        style: TextStyle(
                            color: Color(0xff191923),
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    );
                  }
                  return CombinedChallengesWidget(data: data);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
