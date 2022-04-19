import 'package:flutter/material.dart';
import 'package:flutterdjango/views/academy_page.dart';
import 'package:flutterdjango/views/teacher_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(80, 49, 85, 1),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.sports_kabaddi_rounded),
            Text('    Bem-Vindo!    '),
            Icon(Icons.sports_kabaddi_rounded),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 203, 210, 214),
                onPrimary: const Color.fromARGB(255, 28, 49, 119),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AcademyPage(),
                  ),
                );
              },
              child: const Text('Academia'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 203, 210, 214),
                onPrimary: const Color.fromARGB(255, 28, 49, 119),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => TeacherPage(),
                  ),
                );
              },
              child: const Text('Professores'),
            ),
          ],
        ),
      ),
    );
  }
}
