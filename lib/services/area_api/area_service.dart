import 'dart:convert';
import 'package:graduation_project_flutter/models/area/area.dart';
import 'package:http/http.dart' as http;
import 'package:graduation_project_flutter/services/api_service.dart';

class AreaServiceAPI {
  final baseurl = APIService();

  Future<List<GetArea>> fetchArea() async {
    final response = await http.get(Uri.parse('${baseurl.baseUrl}/system_admin/area/'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => GetArea.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<GetArea> createArea(PostArea area) async {
    final response = await http.post(
      Uri.parse('${baseurl.baseUrl}/system_admin/area/'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(area.toJson()),
    );

    if (response.statusCode == 201) {
      return GetArea.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create area');
    }
  }

  Future<GetArea> updateArea(int id, PostArea area) async {
    final response = await http.patch(
      Uri.parse('${baseurl.baseUrl}/system_admin/area/$id/'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(area.toJson()),
    );

    if (response.statusCode == 200) {
      return GetArea.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update area');
    }
  }

  Future<void> deleteArea(int id) async {
    final response = await http.delete(
      Uri.parse('${baseurl.baseUrl}/system_admin/area/$id/'),
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete area');
    }
  }
}
