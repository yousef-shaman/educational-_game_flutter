import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:graduation_project_flutter/models/challenge.dart';
import 'package:graduation_project_flutter/models/topic.dart';
import 'package:graduation_project_flutter/widgets/custom_gradient_scaffold.dart';
import 'package:graduation_project_flutter/widgets/custom_speed_dial.dart';

class AdminViewer extends StatefulWidget {
  final Map<String, dynamic>? dataOfTopics;

  const AdminViewer({super.key, this.dataOfTopics});

  @override
  State<AdminViewer> createState() => _AdminViewerState();
}

class _AdminViewerState extends State<AdminViewer> {
final TopicBuilder topic = TopicBuilder();
final ChallingesBuilder challinges = ChallingesBuilder();


  Future<bool> _onWillPop(BuildContext context) async {
    bool shouldPop = false;
    await AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      animType: AnimType.rightSlide,
      title: 'You will lose your progress!',
      desc: 'Are you sure you want to exit?',
      btnCancelOnPress: () {},
      btnOkOnPress: () => Navigator.of(context).pop(), 
    ).show();
    return shouldPop;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) => _onWillPop(context),
      child: GradientScaffold(
        body: DefaultTabController(
          length: 3,
          initialIndex: 0,
          child: Scaffold(
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
            floatingActionButtonLocation:
              FloatingActionButtonLocation.miniEndFloat,
          floatingActionButton: Container(
              padding: const EdgeInsets.only(bottom: 15, right: 10),
              child: CustomSpeedDial(
                icon: Icons.edit,
                // animatedIcon: AnimatedIcons.home_menu,
                backgroundColor: Colors.amberAccent,
                onTap: () {
                  
                },
              )),
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
      ),
    );
  }
}
