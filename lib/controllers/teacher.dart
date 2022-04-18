import 'dart:convert';

import 'package:http/http.dart' as http;

Future<Map> fetchTeacher() async {
  var url = 'http://10.0.2.2:8000/academy';

  var response = await http.get(Uri.parse(url));
  var json = jsonDecode(response.body);
  return json;
}
