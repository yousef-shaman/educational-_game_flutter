import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class ViewerPage extends StatefulWidget {
  final dataOfTopics;
  const ViewerPage({super.key, this.dataOfTopics});

  @override
  State<ViewerPage> createState() => _ViewerPageState();
}

class _ViewerPageState extends State<ViewerPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Scaffold(
          backgroundColor: Colors.grey[900],
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  AwesomeDialog(
            dismissOnTouchOutside: false,        
            context: context,
            dialogType: DialogType.warning,
            animType: AnimType.rightSlide,
            title: 'Are you sure !!',
            desc: 'Dialog description here.............',
            btnCancelOnPress: () {},
            btnOkOnPress: () {
              Navigator.of(context).pop();
            },
            ).show();
                  
                }, icon: const Icon(Icons.arrow_back)),
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
          body: TabBarView(
            children: [
              // First tab content
              ListView(children: [
                Container(
                  margin: const EdgeInsets.all(20),
                  child: Text(
                    widget.dataOfTopics["title"],
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      color: Colors.teal,
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                SizedBox(
                  height: 300,
                  child: Card(
                    color: Colors.teal,
                    margin: const EdgeInsets.all(15),

                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        widget.dataOfTopics["body"],
                        style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                )
              ]),
              // Second tab content
              const Center(
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
              const Center(
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
