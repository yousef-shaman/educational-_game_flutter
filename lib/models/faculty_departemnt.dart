class FacultyDepartment {
  final int facultyDepartmentID;
  final DateTime dateCreated;
  final DateTime updatedAt;
  final int? parentID;
  final String name;
  final String? description;

  FacultyDepartment({
    required this.facultyDepartmentID,
    required this.dateCreated,
    required this.updatedAt,
    this.parentID,
    required this.name,
    this.description,
  });

  Map<String, dynamic> toMap() {
    var map = {
      'facultyDepartmentID': facultyDepartmentID,
      'dateCreated': dateCreated.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'name': name,
      'description': description,
    };

    if (parentID != null) {
      map['parentID'] = parentID;
    }

    return map;
  }

  factory FacultyDepartment.fromMap(Map<String, dynamic> map) {
    return FacultyDepartment(
      facultyDepartmentID: map['facultyDepartmentID'],
      dateCreated: DateTime.parse(map['dateCreated']),
      updatedAt: DateTime.parse(map['updatedAt']),
      parentID: map['parentID'],
      name: map['name'],
      description: map['description'],
    );
  }
}
