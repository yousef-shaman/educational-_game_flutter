import 'dart:convert';
import 'package:graduation_project_flutter/models/area/ar_options.dart';
import 'package:http/http.dart' as http;
import 'package:graduation_project_flutter/services/api_service.dart';

class ArOptionsServiceAPI {
  final baseurl = APIService();

  Future<List<GetOptionsArea>> fetchOptions(int id) async {
    final response = await http.get(Uri.parse('${baseurl.baseUrl}/faculty_member/options_area/?questions_area_id=$id'));
    if (response.statusCode == 200) {
      print('length option body: ${response.body}');
      // Decode the JSON response into a dynamic data structure - typically a List or Map
      final jsonResponse = json.decode(response.body);
      
      // Ensure jsonResponse is actually a List before converting
      if (jsonResponse is List) {
        // Map each item in the list to a GetOptionsArea object using the fromJson factory constructor
        return jsonResponse.map<GetOptionsArea>((data) => GetOptionsArea.fromJson(data)).toList();
      } else {
        throw Exception('Expected a list');
      }
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<GetOptionsArea> createOption(PostOptionsArea option) async {
    final response = await http.post(
      Uri.parse('${baseurl.baseUrl}/faculty_member/options_area/'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(option.toJson()),
    );

    if (response.statusCode == 201) {
      return GetOptionsArea.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create option');
    }
  }

  Future<GetOptionsArea> updateOption(int id, PostOptionsArea option) async {
    final response = await http.patch(
      Uri.parse('${baseurl.baseUrl}/faculty_member/options_area/$id/'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(option.toJson()),
    );

    if (response.statusCode == 200) {
      return GetOptionsArea.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update option');
    }
  }

  Future<void> deleteOption(int id) async {
    final response = await http.delete(
      Uri.parse('${baseurl.baseUrl}/faculty_member/options_area/$id/'),
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete option');
    }
  }
}
