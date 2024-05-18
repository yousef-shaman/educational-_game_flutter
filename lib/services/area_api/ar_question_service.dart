import 'dart:convert';
import 'package:graduation_project_flutter/models/area/ar_question.dart';
import 'package:http/http.dart' as http;
import 'package:graduation_project_flutter/services/api_service.dart';

class ArQuestionServiceAPI {
  final baseurl = APIService();

  Future<List<GetQuestionArea>> fetchQuestions(int id) async {
    final response = await http.get(Uri.parse(
        '${baseurl.baseUrl}/faculty_member/question_area/?challenge_area_id=$id'));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);

      if (jsonResponse is List) {
        return jsonResponse.map<GetQuestionArea>((data) => GetQuestionArea.fromJson(data)).toList();
      } else {
        throw Exception('Expected a list');
      }
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<GetQuestionArea> createQuestion(PostQuestionArea question) async {
    final response = await http.post(
      Uri.parse('${baseurl.baseUrl}/faculty_member/question_area/'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(question.toJson()),
    );

    if (response.statusCode == 201) {
      return GetQuestionArea.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create question');
    }
  }

  Future<GetQuestionArea> updateQuestion(int id, PostQuestionArea question) async {
    final response = await http.patch(
      Uri.parse('${baseurl.baseUrl}/faculty_member/question_area/$id/'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(question.toJson()),
    );

    if (response.statusCode == 200) {
      return GetQuestionArea.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update question');
    }
  }

  Future<void> deleteQuestion(int id) async {
    final response = await http.delete(
      Uri.parse('${baseurl.baseUrl}/faculty_member/question_area/$id/'),
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete question');
    }
  }
}
