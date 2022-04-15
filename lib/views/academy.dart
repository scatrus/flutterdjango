import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Academy extends StatelessWidget {
  const Academy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Academia'),
      ),
      body: FutureBuilder(
        future: getAcademy(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Text(
                snapshot.data.toString(),
                style: const TextStyle(fontSize: 20.0),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

Future getAcademy() async {
  var client = http.Client();
  var response = await client.get(Uri.parse('http://10.0.2.2:8000/academy'));
  final academy = academyFromJson(response.body);
}
