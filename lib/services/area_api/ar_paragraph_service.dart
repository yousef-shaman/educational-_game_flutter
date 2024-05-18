import 'dart:convert';
import 'package:graduation_project_flutter/models/area/ar_paragraph.dart';
import 'package:http/http.dart' as http;
import 'package:graduation_project_flutter/services/api_service.dart';

class ArParagraphServiceAPI {
  final baseurl = APIService();

  Future<List<GetParagraphArea>> fetchParagraph(int id) async {
    final response = await http.get(Uri.parse('${baseurl.baseUrl}/faculty_member/paragraph_area/?topic_area_id=$id'));
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      if (jsonResponse is List) {
        return jsonResponse.map<GetParagraphArea>((data) => GetParagraphArea.fromJson(data)).toList();
      } else {
        throw Exception('Expected a list');
      }
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<GetParagraphArea> createParagraph(PostParagraphArea paragraph) async {
    final response = await http.post(
      Uri.parse('${baseurl.baseUrl}/faculty_member/paragraph_area/'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(paragraph.toJson()),
    );

    if (response.statusCode == 201) {
      return GetParagraphArea.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create paragraph');
    }
  }

  Future<GetParagraphArea> updateParagraph(int id, PostParagraphArea paragraph) async {
    final response = await http.patch(
      Uri.parse('${baseurl.baseUrl}/faculty_member/paragraph_area/$id/'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(paragraph.toJson()),
    );

    if (response.statusCode == 200) {
      return GetParagraphArea.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update paragraph');
    }
  }

  Future<void> deleteParagraph(int id) async {
    final response = await http.delete(
      Uri.parse('${baseurl.baseUrl}/faculty_member/paragraph_area/$id/'),
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete paragraph');
    }
  }
}
