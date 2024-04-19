class Major {
  final int majorID;
  final int facultyDepartmentID;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String name;
  final String? description;

  Major({
    required this.majorID,
    required this.facultyDepartmentID,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'majorID': majorID,
      'facultyDepartmentID': facultyDepartmentID,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'name': name,
      'description': description,
    };
  }

  factory Major.fromMap(Map<String, dynamic> map) {
    return Major(
      majorID: map['majorID'],
      facultyDepartmentID: map['facultyDepartmentID'],
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
      name: map['name'],
      description: map['description'],
    );
  }
}
