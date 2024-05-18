import 'package:flutter/material.dart';

class AdminControl extends StatelessWidget {
  final VoidCallback nextQuestion;
  final VoidCallback previousQuestion;

  const AdminControl({
    super.key,
    required this.nextQuestion,
    required this.previousQuestion,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FloatingActionButton(
          onPressed: previousQuestion,
          child: const Icon(Icons.navigate_before),
        ),
        FloatingActionButton(
          onPressed: nextQuestion,
          child: const Icon(Icons.navigate_next),
        ),
      ],
    );
  }
}
