class StudyPlan {
  final int studyPlanID;
  final int majorID;
  final int levels;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String name;
  final String? description;
  final String planDetails;

  StudyPlan({
    required this.studyPlanID,
    required this.majorID,
    required this.levels,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    this.description,
    required this.planDetails,
  });

  Map<String, dynamic> toMap() {
    return {
      'studyPlanID': studyPlanID,
      'majorID': majorID,
      'levels': levels,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'name': name,
      'description': description,
      'planDetails': planDetails,
    };
  }

  factory StudyPlan.fromMap(Map<String, dynamic> map) {
    return StudyPlan(
      studyPlanID: map['studyPlanID'],
      majorID: map['majorID'],
      levels: map['levels'],
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
      name: map['name'],
      description: map['description'],
      planDetails: map['planDetails'],
    );
  }
}
