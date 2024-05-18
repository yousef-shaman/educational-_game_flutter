import 'dart:convert';
import 'package:http/http.dart' as http; // Assuming you have this model
import 'package:graduation_project_flutter/services/api_service.dart';
import '../../models/user/student_performance.dart';

class ArStudentProfermenceAPI {
  final baseurl = APIService(); // Ensure ApiService is correctly implemented

  Future<bool> createStudentProfermence(
      int studentId, int challengeAreaId) async {
    // Check if the performance already exists
    bool performanceExists =
        await checkStudentPerformanceExists(studentId, challengeAreaId);

    if (performanceExists) {
      print(
          'Performance already exists for studentId: $studentId and challengeAreaId: $challengeAreaId');
      return true;
    }

    // If performance does not exist, create it
    var body = jsonEncode({
      "student_profile_id": studentId,
      "challenge_area_id": challengeAreaId,
      "grade": 0, // Initial grade
      "is_completed": false, // Initial state of completion
    });

    var response = await http.post(
      Uri.parse('${baseurl.baseUrl}/student/student_performance_area/'),
      headers: {'Content-Type': 'application/json'},
      body: body,
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return true;
    } else {
      print('Failed to create performance: ${response.body}');
      return false;
    }
  }

  Future<bool> checkStudentPerformanceExists(
      int studentId, int challengeAreaId) async {
    var response = await http.get(
      Uri.parse(
          '${baseurl.baseUrl}/student/student_performance_area/?student_profile_id=$studentId&challenge_area_id=$challengeAreaId'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      var data = jsonDecode(response.body);
      return data.isNotEmpty; // If data is not empty, performance exists
    } else {
      print('Failed to fetch performance: ${response.body}');
      return false;
    }
  }

  Future<List<GetStudentProfermenceArea>> fetchStudentPerformance(
      int studentId, int challengeId) async {
    var url = Uri.parse(
        '${baseurl.baseUrl}/student/student_performance_area/?student_profile_id=$studentId&challenge_area_id=$challengeId');
    var response =
        await http.get(url, headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      print('Student Data: ${response.body}');
      final jsonResponse = json.decode(response.body);
      if (jsonResponse is List) {
        return jsonResponse
            .map<GetStudentProfermenceArea>(
                (data) => GetStudentProfermenceArea.fromJson(data))
            .toList();
      } else {
        throw Exception('Expected a list');
      }
    } else {
      throw Exception('Failed to load data');
    }
    // Return null if no performance found or error
  }

  Future<bool> updateStudentProfermence(
      int performanceId, int studentId, int grade, bool isCompleted) async {
    var body = jsonEncode({
      "student_profile_id": studentId,
      "grade": grade,
      "is_completed": isCompleted,
    });

    var response = await http.patch(
      Uri.parse(
          '${baseurl.baseUrl}/student/student_performance_area/$performanceId/'),
      headers: {'Content-Type': 'application/json'},
      body: body,
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return true;
    } else {
      print('Failed to update performance: ${response.body}');
      return false;
    }
  }
}
