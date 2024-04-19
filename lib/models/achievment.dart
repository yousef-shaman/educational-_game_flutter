class Achievement {
  final int achievementID;
  final int topicID;
  final int pointsDue;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String achievementName;
  final String criteria;

  Achievement({
    required this.achievementID,
    required this.topicID,
    required this.pointsDue,
    required this.createdAt,
    required this.updatedAt,
    required this.achievementName,
    required this.criteria,
  });

  Map<String, dynamic> toMap() {
    return {
      'achievementID': achievementID,
      'topicID': topicID,
      'pointsDue': pointsDue,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'achievementName': achievementName,
      'criteria': criteria,
    };
  }

  factory Achievement.fromMap(Map<String, dynamic> map) {
    return Achievement(
      achievementID: map['achievementID'],
      topicID: map['topicID'],
      pointsDue: map['pointsDue'],
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
      achievementName: map['achievementName'],
      criteria: map['criteria'],
    );
  }
}
