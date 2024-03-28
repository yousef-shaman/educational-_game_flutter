// import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

// @override
//  State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage>{

//   List areas = [
//     {"AreaName": "Mathmatical", "AreaDescription": "------------------",},
//     {"AreaName": "Algrothim", "AreaDescription": "------------------",},
//     {"AreaName": "Database", "AreaDescription": "------------------",},
//   ];

// @override
//   Widget build(BuildContext context) {

//     return MaterialApp(
//       home: DefaultTabController(
//         length: 2,
//         initialIndex: 0,
//         child: Scaffold(backgroundColor: Colors.grey[900],
//           appBar: AppBar(
//             toolbarHeight: 8,
//             bottom: const TabBar(
//               labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//               unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
//               tabs: [

//                 Tab(child: Text("Area", ),),
//                 Tab(child: Text("Event", ),)

//               ],
//             ),
//           ),
//           body: TabBarView(children: [ ListView.builder(
//             itemCount: areas.length,
//             padding: const EdgeInsets.all(10),
//             itemBuilder: (context, i) { return Container(
//               child: TabBarView(children: [

//                 Card(
//                    color: Colors.grey[500],
//                    child: Text(areas[i]["AreaName"], style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold,
//                    color: Colors.red),),
//                  ),

//                 const Text("Events", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontSize: 25),),
//               ],
//               )
//             );
//             },

//             ),],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:graduation_project_flutter/views/student/viewer_page.dart';
import 'package:graduation_project_flutter/controllers/api_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, String>> areas = [
    {"AreaName": "Mathematical", "AreaDescription": "------------------"},
    {"AreaName": "Algorithm", "AreaDescription": "------------------"},
    {"AreaName": "Database", "AreaDescription": "------------------"},
  ];
  final APISevice apisevice = const APISevice();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          backgroundColor: Colors.grey[900],
          appBar: AppBar(
            toolbarHeight: 80, // Adjusted to give enough space for the tabs
            bottom: const TabBar(
              labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              unselectedLabelStyle:
                  TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
              tabs: [
                Tab(child: Text("Area")),
                Tab(child: Text("Event")),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              // First tab content
              FutureBuilder<List>(
                future: apisevice.getData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, i) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ViewerPage(
                                    dataOfTopics: snapshot.data![i],
                                  )));
                        },
                        child: Card(
                          color: Colors.teal,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              '${snapshot.data![i]["title"]}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              // Second tab content
              const Center(
                child: Text(
                  "Events",
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
