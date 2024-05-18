import 'package:graduation_project_flutter/models/user/faculty_departemnt.dart';
import 'package:graduation_project_flutter/services/api_service.dart';
import 'package:http/http.dart' as http;

class FacultyDepartmenAPI {
  final baseurl = APIService();

  Future<List<GetFacultyDepartmen>> fetchFaculties() async {
  var url = Uri.parse('${baseurl.baseUrl}/system_admin/faculty_department/'); // Update with your actual API URL
  var response = await http.get(url);
  if (response.statusCode == 200) {
    return getFacultyDepartmenFromJson(response.body);
  } else {
    throw Exception('Failed to load faculties');
  }
}
}
