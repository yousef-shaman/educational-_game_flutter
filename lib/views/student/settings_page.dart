import 'package:flutter/material.dart';
// import 'package:get/get.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

@override
 State<SettingsPage> createState() => _SettingsPageState();

  
  } 

class _SettingsPageState extends State<SettingsPage>{

  @override
    Widget build(BuildContext context) {

      return Scaffold(
      appBar: AppBar(title: const Text('Settings')),

      body: Scaffold (backgroundColor: Colors.grey[900],),

      );
    }
}