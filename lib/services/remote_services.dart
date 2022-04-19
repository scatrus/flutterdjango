import 'package:flutterdjango/models/academy.dart';
import 'package:http/http.dart' as http;

import '../models/teacher.dart';

class RemoteServices {
  static var client = http.Client();

  static Future<List<Academy>?> fetchAcademys() async {
    var response = await client.get(
      Uri.parse('http://10.0.2.2:8000/academy'),
    );
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return academyFromJson(jsonString);
    } else {
      return null;
    }
  }

  static Future<List<Teacher>?> fetchTeachers() async {
    var response = await client.get(
      Uri.parse('http://10.0.2.2:8000/teacher'),
    );
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return teacherFromJson(jsonString);
    } else {
      return null;
    }
  }
}
