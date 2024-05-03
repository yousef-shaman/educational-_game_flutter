import 'dart:convert';
import 'package:graduation_project_flutter/constants.dart';
import 'package:graduation_project_flutter/models/auth/log_in.dart';
import 'package:graduation_project_flutter/services/api_service.dart';
import 'package:graduation_project_flutter/utilities/local_storge.dart';
import 'package:http/http.dart' as http;

class APIAuth {
  final baseurl = APIService();


  Future<bool> logIn(String email, String password) async {
  Map<String, dynamic> body = {
    "email": email,
    "password": password
  };
  
  try {
    var url = Uri.parse('${baseurl.baseUrl}/authentication/login/');
    var response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );

  if (response.statusCode == 200) {
    final data = loginUserFromJson(response.body);
    saveData(accessToken, data.accessToken!);
    saveData(refreshToken, data.refreshToken!);
    saveData(role, data.role!);
    String? ui = await getData(role);
    print(ui);
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