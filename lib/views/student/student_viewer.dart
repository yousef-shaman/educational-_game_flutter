import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:graduation_project_flutter/models/challenge.dart';
import 'package:graduation_project_flutter/models/topic.dart';
import 'package:graduation_project_flutter/widgets/custom_gradient_scaffold.dart';

class StudentViewer extends StatefulWidget {
  final Map<String, dynamic>? dataOfTopics;

  const StudentViewer({super.key, this.dataOfTopics});

  @override
  State<StudentViewer> createState() => _StudentViewerState();
}

class _StudentViewerState extends State<StudentViewer> {
final TopicBuilder topic = TopicBuilder();
final ChallingesBuilder challinges = ChallingesBuilder();


  Future<bool> _onWillPop(BuildContext context) async {
    bool shouldPop = false;
    await AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      animType: AnimType.rightSlide,
      title: 'متاكد يالحبيب؟',
      desc: 'Are you sure you want to exit?',
      btnCancelOnPress: () {},
      btnOkOnPress: () => Navigator.of(context).pop(),
    ).show();
    return shouldPop;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: GradientScaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => _onWillPop(context),
            ),
            title: const Text('Viewer'),
            bottom: const TabBar(
              tabs: [
                Tab(text: "Topic"),
                Tab(text: "Examples"),
                Tab(text: "Challenges")
              ],
            ),
          ),
          body: TabBarView(
            children: [
              // First tab content
              topic.buildTopicTab(context, dataOfTopics: widget.dataOfTopics),
              // Second tab content
              topic.buildExamplesTab(context, dataOfTopics: widget.dataOfTopics),
              // Third tab content
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                challinges.buildEasyChallinge(context, dataOfTopics: widget.dataOfTopics),
                challinges.buildMediumChallinge(context, dataOfTopics: widget.dataOfTopics),
                challinges.buildHardChallinge(context, dataOfTopics: widget.dataOfTopics)
              ],)
            ],
          ),
        ),
      ),
    );
  }
}
