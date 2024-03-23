import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

@override
 State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

@override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(backgroundColor: Colors.grey[900], 
          appBar: AppBar( 
            toolbarHeight: 8,
            bottom: const TabBar(
              labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
              tabs: [

                Tab(child: Text("Area", ),),
                Tab(child: Text("Event", ),)
              
              ],
            ),
          ),
          body: Container( 
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: const TabBarView(children: [

              Text("Areas", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontSize: 25),),
              Text("Events", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontSize: 25),),
              
              ],
            ),
          ),
        ),
      ),
    );
  }
}