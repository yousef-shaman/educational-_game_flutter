import 'dart:convert';
import 'package:graduation_project_flutter/models/area/ar_topic.dart';
import 'package:http/http.dart' as http;
import 'package:graduation_project_flutter/services/api_service.dart';

class ArTopicServiceAPI {
  final baseurl = APIService();

  Future<List<GetTopicArea>> fetchTopic(int id) async {
    final response = await http.get(Uri.parse('${baseurl.baseUrl}/faculty_member/topic_area/?area_id=$id'));
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      if (jsonResponse is List) {
        return jsonResponse.map<GetTopicArea>((data) => GetTopicArea.fromJson(data)).toList();
      } else {
        throw Exception('Expected a list');
      }
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<GetTopicArea> createTopic(PostTopicArea topic) async {
    final response = await http.post(
      Uri.parse('${baseurl.baseUrl}/faculty_member/topic_area/'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(topic.toJson()),
    );

    if (response.statusCode == 201) {
      return GetTopicArea.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create topic');
    }
  }

  Future<GetTopicArea> updateTopic(int id, PostTopicArea topic) async {
    final response = await http.patch(
      Uri.parse('${baseurl.baseUrl}/faculty_member/topic_area/$id/'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(topic.toJson()),
    );

    if (response.statusCode == 200) {
      return GetTopicArea.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update topic');
    }
  }

  Future<void> deleteTopic(int id) async {
    final response = await http.delete(
      Uri.parse('${baseurl.baseUrl}/faculty_member/topic_area/$id/'),
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete topic');
    }
  }
}
