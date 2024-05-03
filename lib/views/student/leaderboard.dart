import 'package:flutter/material.dart';
import 'package:graduation_project_flutter/widgets/gradient_scaffold.dart';

class Leaderboard extends StatelessWidget {
  const Leaderboard({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.fromLTRB(0, 40, 40, 40),
          child: Text('Leaderboard'),
        ),
      ),
      body: const Scaffold(
      ),
    );
  }
}
