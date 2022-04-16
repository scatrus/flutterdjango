import 'package:flutterdjango/models/academy.dart';
import 'package:http/http.dart' as http;

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
      //show error message
      return null;
    }
  }
}
