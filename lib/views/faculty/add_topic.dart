import 'package:flutter/material.dart';
import 'package:graduation_project_flutter/widgets/custom_gradient_scaffold.dart';

class AddTopic extends StatefulWidget {
  const AddTopic({
    super.key,
  });

  @override
  State<AddTopic> createState() => _AddTopicState();
}

class _AddTopicState extends State<AddTopic> {
  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      body: DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Scaffold(
          backgroundColor: Colors.grey[900],
          appBar: AppBar(
            title: const Text('Viewer'),
            toolbarHeight: 80, // Adjusted to give enough space for the tabs
            bottom: const TabBar(
              labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              unselectedLabelStyle:
                  TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
              tabs: [
                Tab(child: Text("Topic")),
                Tab(child: Text("Examples")),
                Tab(child: Text("Challinges")),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              // First tab content

              Center(
                child: Text(
                  "Topic",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 25,
                  ),
                ),
              ),
              // Second tab content
              Center(
                child: Text(
                  "Examples",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 25,
                  ),
                ),
              ),
              // Third tab content
              Center(
                child: Text(
                  "Challinges",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
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
    );
  }
}
