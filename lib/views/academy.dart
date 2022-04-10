import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// import 'home_page.dart';

class Academy extends StatelessWidget {
  const Academy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Academia'),
      ),
      body: const Text('Academias'),
    );
  }
}

Future getAcademy() async {
  var client = http.Client();
  var response = await client.get(Uri.parse('http://10.0.2.2:8000/academy'));

  debugPrint(response.body);
}
