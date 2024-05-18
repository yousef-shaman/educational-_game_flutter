import 'dart:convert';
import 'package:graduation_project_flutter/models/area/ar_challenge.dart';
import 'package:http/http.dart' as http;
import 'package:graduation_project_flutter/services/api_service.dart';

class ArChallengeServiceAPI {
  final baseurl = APIService();

  Future<List<GetChallengeArea>> fetchChallenge(int id) async {
    final response = await http.get(Uri.parse('${baseurl.baseUrl}/faculty_member/challenge_area/?topic_area_id=$id'));
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      if (jsonResponse is List) {
        return jsonResponse.map<GetChallengeArea>((data) => GetChallengeArea.fromJson(data)).toList();
      } else {
        throw Exception('Expected a list');
      }
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<GetChallengeArea> createChallenge(PostChallengeArea challenge) async {
    final response = await http.post(
      Uri.parse('${baseurl.baseUrl}/faculty_member/challenge_area/'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(challenge.toJson()),
    );

    if (response.statusCode == 201) {
      return GetChallengeArea.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create challenge');
    }
  }

  Future<GetChallengeArea> updateChallenge(int id, PostChallengeArea challenge) async {
    final response = await http.patch(
      Uri.parse('${baseurl.baseUrl}/faculty_member/challenge_area/$id/'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(challenge.toJson()),
    );

    if (response.statusCode == 200) {
      return GetChallengeArea.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update challenge');
    }
  }

  Future<void> deleteChallenge(int id) async {
    final response = await http.delete(
      Uri.parse('${baseurl.baseUrl}/faculty_member/challenge_area/$id/'),
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete challenge');
    }
  }
}
