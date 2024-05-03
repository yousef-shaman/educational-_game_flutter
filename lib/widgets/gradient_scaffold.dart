import 'package:flutter/material.dart';
import 'package:graduation_project_flutter/main.dart';

class GradientScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;

  const GradientScaffold({super.key, required this.body, this.appBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Container(
        decoration: globalBackgroundGradient,
        child: body,
      ),
    );
  }
}