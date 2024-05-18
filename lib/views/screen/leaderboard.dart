import 'package:flutter/material.dart';
import 'package:graduation_project_flutter/constants/text_style.dart';
import '../../models/leaderboard.dart';
import '../../services/user_service.dart';
import '../../widgets/gradient_scaffold.dart';

class Leaderboard extends StatefulWidget {
  const Leaderboard({super.key});

  @override
  State<Leaderboard> createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  late Future<List<GetLeaderboard>> _leaderboardFuture;

  @override
  void initState() {
    super.initState();
    _leaderboardFuture = UserAPI().fetchLeaderboard();
  }

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      body: Scaffold(
        appBar: AppBar(
          title: const Text("Leaderboard"),
        ),
        body: FutureBuilder<List<GetLeaderboard>>(
          future: _leaderboardFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    GetLeaderboard student = snapshot.data![index];
                    return Card(
                      elevation: 20,
                      margin:
                          const EdgeInsets.only(top: 15, left: 15, right: 15),
                      child: ListTile(
                        leading: CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.amber,
                            child: Text(
                              '${index + 1}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w900),
                            )),
                        title: Text(
                          "${student.firstName} ${student.lastName}",
                          style: labelMediem,
                        ),
                        subtitle:
                            Text("Level ${student.level}", style: labelSmall),
                        trailing:
                            Text("${student.earnedPoints}", style: labelMediem),
                        style: ListTileStyle.list,
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Center(child: Text("Error: ${snapshot.error}"));
              }
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
