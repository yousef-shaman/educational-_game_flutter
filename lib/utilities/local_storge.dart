import 'package:shared_preferences/shared_preferences.dart';

//Get Data
Future<String?> getData(String key) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString(key);
}

//Add/Update Data
Future<bool> saveData(String key, String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return await prefs.setString(key, value);
}

//Delete Data
Future<bool> deleteData(String key) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return await prefs.remove(key);
}


