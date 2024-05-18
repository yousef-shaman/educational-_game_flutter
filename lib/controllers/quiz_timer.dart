import 'package:flutter/material.dart';

class QuizTimer extends StatelessWidget {
  final AnimationController controller;
  final bool isStopped;

  const QuizTimer({
    super.key,
    required this.controller,
    required this.isStopped,
  });

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: isStopped ? 1.0 : controller.value,
      backgroundColor: Colors.grey,
      valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
    );
  }
}
