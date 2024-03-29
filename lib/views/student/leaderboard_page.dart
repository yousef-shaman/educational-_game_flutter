import 'package:flutter/material.dart';

class Leaderboard extends StatelessWidget {
  const Leaderboard({super.key});


  @override
  Widget build(BuildContext context) {

    return Scaffold(
    appBar: AppBar(title: const Padding(
    padding: EdgeInsets.fromLTRB(0,40,40,40),
    child: Text('Leaderboard'),
  ),),

    body: Scaffold (backgroundColor: Colors.grey[900], ),
    );
  }
}