import 'package:flutter/material.dart';

class UndefinedRoutePage extends StatelessWidget {
  const UndefinedRoutePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Placeholder(
      color: Colors.blueAccent,
      child: Text("Undefined Route Page", style: Theme.of(context).textTheme.displayLarge,),
    );
  }
}