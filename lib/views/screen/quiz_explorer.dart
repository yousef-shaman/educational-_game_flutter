import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import '../../build/bld_question.dart';
import '/models/area/ar_options.dart';
import '/models/area/ar_question.dart';
import '/services/area_api/ar_options_service.dart';
import '/services/area_api/ar_question_service.dart';
import '/widgets/gradient_scaffold.dart';
import '/widgets/speed_dial.dart';

class QuizExplorer extends StatefulWidget {
  final int challengeId;
  const QuizExplorer({super.key, required this.challengeId});

  @override
  State<QuizExplorer> createState() => _QuizExplorerState();
}

class _QuizExplorerState extends State<QuizExplorer> {
  final questionAPI = ArQuestionServiceAPI();
  late Future<List<GetQuestionArea>> _questionsFuture;
  List<GetQuestionArea> _questions = [];
  List<GetOptionsArea> _options = [];
  int currentQuestionIndex = 0;

  @override
  void initState() {
    super.initState();
    _questionsFuture = questionAPI.fetchQuestions(widget.challengeId);
    _questionsFuture.then((questionsLoaded) {
      if (mounted) {
        setState(() {
          _questions = questionsLoaded;
          if (_questions.isNotEmpty) {
            _loadOptions(_questions.first.id!);
          }
        });
      }
    }).catchError((error) {
      print('Failed to load questions: $error');
    });
  }

  Future<void> _loadOptions(int questionId) async {
    try {
      var options = await ArOptionsServiceAPI().fetchOptions(questionId);
      if (mounted) {
        setState(() {
          _options = options;
        });
      }
    } catch (e) {
      print('Failed to load options for questionId $questionId: $e');
      setState(() {
        _options = []; // Ensure list is empty to prevent bad access
      });
    }
  }

  void nextQuestion() {
    if (currentQuestionIndex < _questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        _loadOptions(_questions[currentQuestionIndex].id!);
      });
    }
  }

  void previousQuestion() {
    if (currentQuestionIndex > 0) {
      setState(() {
        currentQuestionIndex--;
        _loadOptions(_questions[currentQuestionIndex].id!);
      });
    }
  }

  void addQuestion() {
    // Implement the function to add a question
  }

  void deleteQuestion(int questionId) {
    // Implement the function to delete a question
  }

  void updateQuestion(int questionId) {
    // Implement the function to update a question
  }

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      body: Scaffold(
        appBar: AppBar(
          title: const Text('Quiz Explorer'),
        ),
        floatingActionButton: CustomSpeedDial(
          animatedIcon: AnimatedIcons.menu_close,
          backgroundColor: Colors.amberAccent,
          children: [
            SpeedDialChild(
              child: const Icon(Icons.add),
              label: 'Add Question',
              onTap: addQuestion,
            ),
            SpeedDialChild(
              child: const Icon(Icons.delete),
              label: 'Delete Question',
              onTap: () => deleteQuestion(_questions[currentQuestionIndex].id!),
            ),
            SpeedDialChild(
              child: const Icon(Icons.edit),
              label: 'Update Question',
              onTap: () => updateQuestion(_questions[currentQuestionIndex].id!),
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_questions.isNotEmpty)
              QuestionWidget(
                question: _questions[currentQuestionIndex],
                index: currentQuestionIndex,
                totalQuestions: _questions.length,
                options: _options,
                isAnswered: false,
                checkAnswer: (_) {},
              ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: previousQuestion,
                  child: const Text('Previous'),
                ),
                ElevatedButton(
                  onPressed: nextQuestion,
                  child: const Text('Next'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
