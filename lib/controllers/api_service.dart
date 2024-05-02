import 'dart:convert';
import 'package:graduation_project_flutter/models/user.dart';
import 'package:http/http.dart' as http;

class APIService {
  // Base URL for your API
  // final String baseUrl = 'https://jsonplaceholder.typicode.com';
  final String baseUrl = 'http://192.168.100.7:8000/api';

  // Function to get user data
  Future<List<dynamic>> getRequestsData() async {
    var url = Uri.parse('$baseUrl/users');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body) as List<dynamic>;
    } else {
      throw Exception('Failed to load users');
    }
  }

  // Function to get posts data
  Future<List<dynamic>> getAreaData() async {
    var url = Uri.parse('$baseUrl/posts');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body) as List<dynamic>;
    } else {
      throw Exception('Failed to load posts');
    }
  }

  Future<bool> logIn(String email, String password) async {
  Map<String, dynamic> body = {
    "email": email,
    "password": password
  };
  try {
    var url = Uri.parse('$baseUrl/authentication/login/');
  var response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(body),
  );

  if (response.statusCode == 200) {
    final data = loginUserFromJson(response.body);
    print(data.toJson());  // Assuming that `loginUserFromJson` returns an object with an `email` field.
    return true;
  } else {
    // Optionally, log the response body to debug unsuccessful logins
    print('Failed to log in: ${response.body}');
    return false;
  }
  }
  catch(e){
    print(e);
    return false;
  }
}
}

