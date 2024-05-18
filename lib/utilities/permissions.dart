import '../constants/globals.dart';

bool isSystemAdmin() {
  return userRole == 'A';
}

bool isFacultyMember() {
  return userRole == 'F';
}

bool isStudent() {
  return userRole == 'S';
}