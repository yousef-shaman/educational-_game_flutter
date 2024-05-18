import 'package:flutter/material.dart';
import '/models/area/ar_options.dart';
import '/widgets/option_card.dart';

class OptionCardList extends StatelessWidget {
  final List<GetOptionsArea> options;
  final bool isAnswered;
  final void Function(GetOptionsArea) onOptionTap;

  const OptionCardList({
    super.key,
    required this.options,
    required this.isAnswered,
    required this.onOptionTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: options.map((option) {
        return GestureDetector(
          onTap: () => onOptionTap(option),
          child: OptionCard(
            option: option.optionSyntax ?? "",
            color: isAnswered && option.isCorrect! ? Colors.green : Colors.white,
          ),
        );
      }).toList(),
    );
  }
}
