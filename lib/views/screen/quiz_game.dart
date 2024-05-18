import 'package:flutter/material.dart';
import '../../build/bld_question.dart';
import '/models/area/ar_options.dart';
import '/models/area/ar_question.dart';
import '/services/area_api/ar_options_service.dart';
import '/services/area_api/ar_question_service.dart';
import '/widgets/gradient_scaffold.dart';
import '/widgets/result_box.dart';
import '../../constants/constants.dart';
import '../../models/user/student.dart';
import '../../models/user/student_performance.dart';
import '../../services/area_api/ar_student_profermence_service.dart';
import '../../services/user_service.dart';
import '../../utilities/jwt_decoder.dart';
import '../../utilities/local_storge.dart';

class QuizGame extends StatefulWidget {
  final int challengeId;
  const QuizGame({super.key, required this.challengeId});

  @override
  State<QuizGame> createState() => _QuizGameState();
}

class _QuizGameState extends State<QuizGame> with TickerProviderStateMixin {
  final questionAPI = ArQuestionServiceAPI();
  final studentPerformanceAPI = ArStudentProfermenceAPI();
  late AnimationController controller;
  late GetQuestionArea currentQuestion;
  late Future<List<GetQuestionArea>> _questionsFuture;
  List<GetQuestionArea> _questions = [];
  List<GetOptionsArea> _options = [];
  int currentQuestionIndex = 0;
  int score = 0;
  bool isAnswered = false;
  int? _userId;
  int? _studentProfileId;
  int? _performanceId;
  int? _facultyDepartmentId;
  DateTime? _birthDate;
  String? _gender;
  double? _gpa;
  int? _earnedPoints;
  bool isCompleted = false;
  int? _level;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10), // Default, safe value
    );
    setupAnimationListeners();

    _questionsFuture = questionAPI.fetchQuestions(widget.challengeId);
    _questionsFuture.then((questionsLoaded) {
      if (mounted) {
        setState(() {
          _questions = questionsLoaded;
          if (_questions.isNotEmpty) {
            currentQuestion = _questions.first;
            setupController(currentQuestion.timeValue!
                .toInt()); // Ensure there's a fallback value
            _loadOptions(currentQuestion.id!);
          }
        });
      }
    }).catchError((error) {
      print('Failed to load questions: $error');
    });

    fetchUserId();
  }

  Future<void> createStudentPerformanceIfNotExist() async {
    try {
      if (_studentProfileId != null) {
        // Check if the performance already exists
        bool performanceExists =
            await studentPerformanceAPI.checkStudentPerformanceExists(
                _studentProfileId!, widget.challengeId);

        if (performanceExists) {
          // Fetch the existing performance ID
          List<GetStudentProfermenceArea> existingPerformance =
              await studentPerformanceAPI.fetchStudentPerformance(
                  _studentProfileId!, widget.challengeId);
          if (existingPerformance.isNotEmpty) {
            setState(() {
              _performanceId = existingPerformance.first.id;
              isCompleted = existingPerformance.first.isCompleted!;
            });
            print(
                "Performance already exists. Performance ID: $_performanceId");
          } else {
            print("Failed to fetch existing performance.");
          }
        } else {
          // Create new performance
          var creationSuccess = await studentPerformanceAPI
              .createStudentProfermence(_studentProfileId!, widget.challengeId);
          if (creationSuccess) {
            // Fetch the newly created performance ID
            List<GetStudentProfermenceArea> newPerformance =
                await studentPerformanceAPI.fetchStudentPerformance(
                    _studentProfileId!, widget.challengeId);
            if (newPerformance.isNotEmpty) {
              setState(() {
                _performanceId = newPerformance.first.id;
              });
            } else {
              print("Failed to fetch new performance after creation.");
            }
          } else {
            print("Failed to create new performance.");
          }
          print('Performance creation success: $creationSuccess');
        }
      } else {
        print('Student profile ID not available for performance creation');
      }
    } catch (e) {
      print("Error fetching studentPerformance data: $e");
    }
  }

  void fetchUserId() async {
    String? token = await getData(accessToken);
    if (token != null) {
      int userId = decodeToken(token);
      setState(() {
        _userId = userId;
      });
      fetchStudentProfileData(userId);
    } else {
      print("No token found, user is probably not logged in");
    }
  }

  Future<void> fetchStudentProfileData(int userId) async {
    try {
      List<GetStudent> studentProfiles =
          await UserAPI().fetchStudentData(userId);
      if (studentProfiles.isNotEmpty) {
        var firstProfile = studentProfiles.first;
        setState(() {
          _studentProfileId = firstProfile.id;
          _facultyDepartmentId = firstProfile.facultyDepartment;
          _birthDate = firstProfile.birthDate;
          _gender = firstProfile.gender;
          _gpa = firstProfile.gpa ?? 0.0;
          _level = firstProfile.level ?? 1;
          _earnedPoints = firstProfile.earnedPoints;
          if (isCompleted) {
            _earnedPoints = studentProfiles.first.earnedPoints;
          } else {
            _earnedPoints = score + (studentProfiles.first.earnedPoints!);
          }
        });
        createStudentPerformanceIfNotExist();
      }
    } catch (e) {
      print("Error fetching student data: $e");
    }
  }

  void setupAnimationListeners() {
    controller.addListener(() {
      setState(() {});
    });
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        nextQuestion();
      }
    });
  }

  void setupController(int seconds) {
    controller.dispose();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: seconds),
    );
    setupAnimationListeners();
    controller.forward();
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

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void nextQuestion() {
    if (currentQuestionIndex < _questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        currentQuestion = _questions[currentQuestionIndex];
        _loadOptions(currentQuestion.id!);
        isAnswered = false;
        setupController(currentQuestion.timeValue!.toInt());
      });
    } else {
      showResultDialog();
    }
  }

  int calculateTotalPoints() {
    return _questions.fold(
        0,
        (previousValue, element) =>
            previousValue + element.totalPoints!.toInt());
  }

  void showResultDialog() {
    controller.stop();
    int totalPoints = calculateTotalPoints();
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => ResultBox(
        result: score,
        totalPoints: totalPoints,
        onPressed: startOver,
        questionLength: _questions.length,
        onSaveAndComplete: () async {
          await createStudentPerformanceIfNotExist();
          await fetchStudentProfileData(_userId!);
          if (_studentProfileId != null && _performanceId != null) {
            await updateStudentPerformance(
                _performanceId!, score, _studentProfileId!);
            await updateStudentProfile(_studentProfileId!, _facultyDepartmentId!,
                _birthDate!, _gender!, _gpa!, _level!, _earnedPoints!);
            Navigator.of(context).pop();
          } else {
            print(
                "StudentProfileId or PerformanceId is null : $_performanceId - $_studentProfileId");
          }
        },
      ),
    );
  }

  Future<void> updateStudentPerformance(
      int performanceId, int totalPoints, int studentId) async {
    bool isUpdated = await studentPerformanceAPI.updateStudentProfermence(
        performanceId, studentId, totalPoints, true);
    if (isUpdated) {
      print("Performance updated successfully");
    } else {
      print("Failed to update performance");
    }
  }

  Future<void> updateStudentProfile(
      int studentId,
      int fcMId,
      DateTime birthDate,
      String gender,
      double gpa,
      int level,
      int earnedPoints) async {
    bool isEarnedPointsUpdated = await UserAPI().submitStudentProfile(
        studentId, fcMId, birthDate, gender, gpa, level, earnedPoints);
    if (isEarnedPointsUpdated) {
      print("Profile updated successfully");
    } else {
      print("Failed to update Profile");
    }
  }

  void checkAnswerAndUpdate(bool isCorrect) {
    if (!isAnswered) {
      if (isCorrect) {
        score += currentQuestion.totalPoints!.toInt();
      }
      setState(() {
        isAnswered = true;
      });

      Future.delayed(const Duration(milliseconds: 4000), () {
        nextQuestion();
      });
    }
  }

  void startOver() {
    Navigator.of(context).pop();
    setState(() {
      currentQuestionIndex = 0;
      score = 0;
      isAnswered = false;
      if (_questions.isNotEmpty) {
        currentQuestion = _questions[currentQuestionIndex];
        _loadOptions(currentQuestion.id!);
        setupController(currentQuestion.timeValue!.toInt());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      body: Scaffold(
        body: FutureBuilder<List<GetQuestionArea>>(
          future: _questionsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                return QuestionWidget(
                  question: snapshot.data![currentQuestionIndex],
                  index: currentQuestionIndex,
                  totalQuestions: _questions.length,
                  options: _options,
                  isAnswered: isAnswered,
                  checkAnswer: checkAnswerAndUpdate,
                  prograssValue: controller.value,
                  score: score,
                );
              } else {
                return const Text('No questions available');
              }
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
