class StudentPerformance {
  final int performanceID;
  final int studentID;
  final int achievementID;
  final int pointsEarned;
  final DateTime awardDate;
  final DateTime earnedDate;
  final DateTime earnedTime;
  final DateTime createdAt;
  final DateTime updatedAt;

  StudentPerformance({
    required this.performanceID,
    required this.studentID,
    required this.achievementID,
    required this.pointsEarned,
    required this.awardDate,
    required this.earnedDate,
    required this.earnedTime,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'performanceID': performanceID,
      'studentID': studentID,
      'achievementID': achievementID,
      'pointsEarned': pointsEarned,
      'awardDate': awardDate.toIso8601String(),
      'earnedDate': earnedDate.toIso8601String(),
      'earnedTime': earnedTime.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory StudentPerformance.fromMap(Map<String, dynamic> map) {
    return StudentPerformance(
      performanceID: map['performanceID'],
      studentID: map['studentID'],
      achievementID: map['achievementID'],
      pointsEarned: map['pointsEarned'],
      awardDate: DateTime.parse(map['awardDate']),
      earnedDate: DateTime.parse(map['earnedDate']),
      earnedTime: DateTime.parse(map['earnedTime']),
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
    );
  }
}
