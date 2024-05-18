import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/globals.dart';
import '../views/authentication/signin_page.dart';
import 'jwt_decoder.dart';

//Get Data
Future<String?> getData(String key) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  // return prefs.getString(key);
  String? value = prefs.getString(key);
  if (key == 'role' && value != null) {
    userRole = value;
  }
  return value;
}

//Add/Update Data
Future<bool> saveData(String key, String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  // return await prefs.setString(key, value);
  if (key == 'role') {
    userRole = value;
  }
  return await prefs.setString(key, value);
}

//Delete Data
Future<bool> clearData(String key) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  // return await prefs.remove(key);
  if (key == 'role') {
    userRole = '';
  }
  return await prefs.remove(key);
}

Future<bool> isLoggedIn() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('accessToken'); // Assuming you use accessToken
  return token != null;
}


Future<void> checkTokenAndRedirect(BuildContext context) async {
  String? token = await getData('accessToken');
  if (token == null || isTokenExpired(token)) {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const SignInPage()));
  }
}