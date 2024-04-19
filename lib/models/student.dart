class Student {
  final int studentID;
  final int userID;
  final int majorID;
  final int facultyDepartmentID;
  final String firstName;
  final String lastName;
  final int level;
  final double gpa;
  final int totalPoints;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String email;
  final String status;

  Student({
    required this.studentID,
    required this.userID,
    required this.majorID,
    required this.facultyDepartmentID,
    required this.firstName,
    required this.lastName,
    required this.level,
    required this.gpa,
    required this.totalPoints,
    required this.createdAt,
    required this.updatedAt,
    required this.email,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'studentID': studentID,
      'userID': userID,
      'majorID': majorID,
      'facultyDepartmentID': facultyDepartmentID,
      'firstName': firstName,
      'lastName': lastName,
      'level': level,
      'gpa': gpa,
      'totalPoints': totalPoints,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'email': email,
      'status': status,
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      studentID: map['studentID'],
      userID: map['userID'],
      majorID: map['majorID'],
      facultyDepartmentID: map['facultyDepartmentID'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      level: map['level'],
      gpa: map['gpa'],
      totalPoints: map['totalPoints'],
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
      email: map['email'],
      status: map['status'],
    );
  }
}
