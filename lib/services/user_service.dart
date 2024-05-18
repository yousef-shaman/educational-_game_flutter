import 'dart:convert';
import 'package:graduation_project_flutter/models/user/student.dart';
import 'package:http/http.dart' as http; // Assuming you have this model
import 'package:graduation_project_flutter/services/api_service.dart';

import '../models/leaderboard.dart';
import '../models/user/admin.dart';

class UserAPI {
  final baseurl = APIService(); // Ensure ApiService is correctly implemented

  Future<bool> submitStudentProfile(
    int studentId,
    int facultyDepartment,
    DateTime birthDate,
    String gender,
    double gpa,
    int level,
    int earnedPoints,
  ) async {
    // Format the date to YYYY-MM-DD
    String formattedDate = "${birthDate.year.toString().padLeft(4, '0')}-${birthDate.month.toString().padLeft(2, '0')}-${birthDate.day.toString().padLeft(2, '0')}";

    Map<String, dynamic> body = {
      "faculty_department": facultyDepartment,
      "birth_date": formattedDate, // Use the formatted date
      "gender": gender,
      "gpa": gpa,
      "level": level,
      "earned_points": earnedPoints
    };

    try {
      var url = Uri.parse('${baseurl.baseUrl}/student/student_profile/$studentId/');
      var response = await http.patch(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return true;
      } else {
        print('Failed to create profile: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Error submitting profile: $e');
      return false;
    }
  }


  Future<List<GetStudent>> fetchStudentData(int id) async {
    final response = await http
        .get(Uri.parse('${baseurl.baseUrl}/student/student_profile/?user=$id'));
    if (response.statusCode == 200) {
      print('Student Data: ${response.body}');
      // Decode the JSON response into a dynamic data structure - typically a List or Map
      final jsonResponse = json.decode(response.body);

      // Ensure jsonResponse is actually a List before converting
      if (jsonResponse is List) {
        // Map each item in the list to a GetTopicArea object using the fromJson factory constructor
        return jsonResponse
            .map<GetStudent>((data) => GetStudent.fromJson(data))
            .toList();
      } else {
        throw Exception('Expected a list');
      }
    } else {
      throw Exception('Failed to load data');
    }
  }


  Future<List<GetSystemAdmin>> fetchAdminData(int id) async {
    final response = await http
        .get(Uri.parse('${baseurl.baseUrl}/system_admin/system_admin_profile/?user=$id'));
    if (response.statusCode == 200) {
      print('Student Data: ${response.body}');
      // Decode the JSON response into a dynamic data structure - typically a List or Map
      final jsonResponse = json.decode(response.body);

      // Ensure jsonResponse is actually a List before converting
      if (jsonResponse is List) {
        // Map each item in the list to a GetTopicArea object using the fromJson factory constructor
        return jsonResponse
            .map<GetSystemAdmin>((data) => GetSystemAdmin.fromJson(data))
            .toList();
      } else {
        throw Exception('Expected a list');
      }
    } else {
      throw Exception('Failed to load data');
    }
  }



  Future<List<GetLeaderboard>> fetchLeaderboard() async {
    var url = Uri.parse('${baseurl.baseUrl}/student/leaderboard/');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      return getLeaderboardFromJson(response.body);
    } else {
      // handle error
      throw Exception('Failed to load leaderboard');
    }
  }
}
