import 'package:flutter/material.dart';
import 'package:graduation_project_flutter/models/area/ar_challenge.dart';
import 'package:graduation_project_flutter/views/screen/quiz_game.dart';
import 'package:graduation_project_flutter/widgets/glass_card.dart';
import '../utilities/permissions.dart';
import '../views/screen/quiz_explorer.dart';

class CombinedChallengesWidget extends StatefulWidget {
  final List<GetChallengeArea> data;

  const CombinedChallengesWidget({super.key, required this.data});

  @override
  State<CombinedChallengesWidget> createState() => _CombinedChallengesWidgetState();
}

class _CombinedChallengesWidgetState extends State<CombinedChallengesWidget> {
  void _showUpdateDeleteDialog(BuildContext context, GetChallengeArea challenge) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Update or Delete Challenge'),
          content: const Text('Would you like to update or delete this challenge?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Navigate to the update challenge page
                Navigator.pushNamed(context, "update_challenge", arguments: challenge);
              },
              child: const Text('Update'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _deleteChallenge(context, challenge);
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  void _deleteChallenge(BuildContext context, GetChallengeArea challenge) async {
    try {
      // await ArChallengeServiceAPI().deleteChallenge(challenge.id!);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Challenge deleted successfully')),
      );
      setState(() {
        widget.data.remove(challenge);
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to delete challenge')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: buildChallengeByDifficulty(
                context, 'B', Icons.hive, Colors.greenAccent)),
        Expanded(
            child: buildChallengeByDifficulty(context, 'I',
                Icons.mode_standby_outlined, Colors.orangeAccent)),
        Expanded(
            child: buildChallengeByDifficulty(context, 'A',
                Icons.local_fire_department_rounded, Colors.redAccent)),
      ],
    );
  }

  Widget buildChallengeByDifficulty(
      BuildContext context, String difficulty, IconData icon, Color color) {
    return ListView.builder(
      itemCount: widget.data.length,
      itemBuilder: (context, i) {
        GetChallengeArea challengeArea = widget.data[i];
        if (challengeArea.difficulty == difficulty) {
          return InkWell(
            onLongPress: () {
              if (isSystemAdmin() || isFacultyMember()) {
                _showUpdateDeleteDialog(context, challengeArea);
              }
            },
            child: SizedBox(
              height: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: isStudent() ? () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => QuizGame(
                                challengeId: challengeArea.id!,
                              )));
                    } : 
                    () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => QuizExplorer(
                                challengeId: challengeArea.id!,
                              )));
                    },
                    child: CustomGlassCard(
                      margin: const EdgeInsets.all(15),
                      height: 150,
                      width: 150,
                      borderRadius: BorderRadius.circular(400),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Icon(
                            icon,
                            color: color,
                            size: 100,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return Container(); // Returning an empty container when no data matches
      },
    );
  }
}
