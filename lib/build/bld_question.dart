import 'package:flutter/material.dart';
import 'package:graduation_project_flutter/constants/text_style.dart';
import '../utilities/permissions.dart';
import '/models/area/ar_options.dart';
import '/models/area/ar_question.dart';
import '/widgets/option_card.dart';

class QuestionWidget extends StatelessWidget {
  final GetQuestionArea question;
  final int index;
  final int totalQuestions;
  final List<GetOptionsArea> options;
  final bool isAnswered;
  final Function(bool) checkAnswer;
  final double? prograssValue;
  final int? score;

  const QuestionWidget({
    super.key,
    required this.question,
    required this.index,
    required this.totalQuestions,
    required this.options,
    required this.isAnswered,
    required this.checkAnswer, this.prograssValue, this.score,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              margin: const EdgeInsets.all(10),
              child: isStudent() ? Text(
                'Score: $score',
                style: const TextStyle(fontSize: 18.0),
              ) : null,
            ),
          SizedBox(
            width: double.infinity,
            child: isStudent() ?
            LinearProgressIndicator(
            value: prograssValue,
            backgroundColor: Colors.grey,
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
          ) : null,
          ),
          
          const SizedBox(height: 20),
          Text(
            '${index + 1}/$totalQuestions',
            style: const TextStyle(fontSize: 18.0),
          ),
          const SizedBox(height: 20),
          Text(
            question.questionTitle ?? "No question available",
            style: labelSmall,
          ),
          const SizedBox(height: 20),
          ...options.map((option) => GestureDetector(
            onTap: () {
              if (!isAnswered) {
                checkAnswer(option.isCorrect ?? false);
              }
            },
            child: OptionCard(
              option: option.optionSyntax ?? "",
              color: isAnswered && option.isCorrect! ? Colors.green : Colors.white,
            ),
          ))
        ],
      ),
    );
  }
}
