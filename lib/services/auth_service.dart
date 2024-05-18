import 'dart:convert';
import 'package:graduation_project_flutter/constants/constants.dart';
import 'package:graduation_project_flutter/models/auth/log_user.dart';
import 'package:graduation_project_flutter/services/api_service.dart';
import 'package:graduation_project_flutter/utilities/local_storge.dart';
import 'package:http/http.dart' as http;

class APIAuth {
  final baseurl = APIService();

  Future<bool> logIn(String email, String password) async {
    Map<String, dynamic> body = {"email": email, "password": password};

    try {
      var url = Uri.parse('${baseurl.baseUrl}/authentication/login/');
      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final data = loginUserFromJson(response.body);
        saveData(accessToken, data.accessToken!);
        saveData(refreshToken, data.refreshToken!);
        saveData(role, data.role!);
        saveData(fullName, data.fullName!);
        saveData(emailLS, data.email!);
        saveData(eduId, data.eduId!);
        String? rol = await getData(role);
        print(rol);
        String? name = await getData(fullName);
        print(name);
        return true;
      } else {
        // Optionally, log the response body to debug unsuccessful logins
        print('Failed to log in: ${response.body}');
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> register(String email, String firstName, String lastName,
      String role, String eduId, String password, String password2) async {
    Map<String, dynamic> body = {
      "email": email,
      "first_name": firstName,
      "last_name": lastName,
      "role": role,
      "edu_id": eduId,
      "password": password,
      "password2": password2
    };

    try {
      var url = Uri.parse('${baseurl.baseUrl}/authentication/register/');
      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        // Optionally handle any data returned from the registration
        return true;
      } else {
        print('Failed to register: ${response.body}');
        return false;
      }
    } catch (e) {
      print('An expicted error : $e');
      return false;
    }
  }

  Future<bool> verifyOTP(String email, String otp) async {
    var url = Uri.parse(
        '${baseurl.baseUrl}/authentication/verify-email/'); // Update with your actual API URL
    var response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"email": email, "otp": otp}),
    );

    return response.statusCode >= 200 && response.statusCode < 300;
  }

  Future<bool> logout(String refreshToken) async {
    try {
      LogoutUser logoutData = LogoutUser(refreshToken: refreshToken);
      var url = Uri.parse('${baseurl.baseUrl}/authentication/logout/');
      String? accessToken = await getData(
          'accessToken'); // Retrieve the access token from local storage
      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer $accessToken' // Include the authorization header
        },
        body: logoutUserToJson(logoutData),
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return true;
      } else {
        print('Failed to logout: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Error logging out: $e');
      return false;
    }
  }
}
