import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:graduation_project_flutter/widgets/custom_glass_card.dart';
import 'package:graduation_project_flutter/widgets/custom_gradient_scaffold.dart';

class StudentViewer extends StatefulWidget {
  final Map? dataOfTopics;

  const StudentViewer({super.key, this.dataOfTopics});

  @override
  State<StudentViewer> createState() => _StudentViewerState();
}

class _StudentViewerState extends State<StudentViewer> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: GradientScaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              AwesomeDialog(
                context: context,
                dialogType: DialogType.warning,
                animType: AnimType.rightSlide,
                title: 'متاكد يالحبيب؟',
                desc: 'Dialog description here...',
                btnCancelOnPress: () {},
                btnOkOnPress: () => Navigator.of(context).pop(),
              ).show();
            },
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
            buildTopicTab(context),
            // Second tab content
            const Center(
              child: Text(
                "Examples",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff191923),
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontSize: 25,
                ),
              ),
            ),
            // Third tab content
            const Center(
              child: Text(
                "Challinges",
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
    );
  }

  Widget buildTopicTab(BuildContext context) {
    if (widget.dataOfTopics == null) {
      return const Center(
          child: Text("No data provided.",
              style: TextStyle(
                  color: Color(0xff191923),
                  fontSize: 18,
                  fontWeight: FontWeight.w600)));
    }
    return ListView(
      children: [
        Container(
          margin: const EdgeInsets.all(20),
          child: Text(
            widget.dataOfTopics!["title"] ?? "No Title",
            style: const TextStyle(
                color: Color(0xff191923), fontSize: 22, fontWeight: FontWeight.w900),
          ),
        ),
        CustomGlassCard(
          margin: const EdgeInsets.all(15),
          content: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                widget.dataOfTopics!["body"] ?? "No Content",
                style: const TextStyle(
                    color: Color(0xff191923),
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),)
      ],
    );
  }
}
