class User {
  final int userID;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String username;
  final String password;
  final String role;
  final String? email;

  User({
    required this.userID,
    required this.createdAt,
    required this.updatedAt,
    required this.username,
    required this.password,
    required this.role,
    this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'userID': userID,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'username': username,
      'password': password,
      'role': role,
      'email': email,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      userID: map['userID'],
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
      username: map['username'],
      password: map['password'],
      role: map['role'],
      email: map['email'],
    );
  }
}
