class Staff {
  final int staffID;
  final int userID;
  final int facultyDepartmentID;
  final DateTime hireDate;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String firstName;
  final String lastName;
  final String role;
  final String? permissions;
  final String email;
  final String status;

  Staff({
    required this.staffID,
    required this.userID,
    required this.facultyDepartmentID,
    required this.hireDate,
    required this.createdAt,
    required this.updatedAt,
    required this.firstName,
    required this.lastName,
    required this.role,
    this.permissions,
    required this.email,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    var map = {
      'staffID': staffID,
      'userID': userID,
      'facultyDepartmentID': facultyDepartmentID,
      'hireDate': hireDate.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'firstName': firstName,
      'lastName': lastName,
      'role': role,
      'permissions': permissions,
      'email': email,
      'status': status,
    };

    return map;
  }

  factory Staff.fromMap(Map<String, dynamic> map) {
    return Staff(
      staffID: map['staffID'],
      userID: map['userID'],
      facultyDepartmentID: map['facultyDepartmentID'],
      hireDate: DateTime.parse(map['hireDate']),
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
      firstName: map['firstName'],
      lastName: map['lastName'],
      role: map['role'],
      permissions: map['permissions'],
      email: map['email'],
      status: map['status'],
    );
  }
}
