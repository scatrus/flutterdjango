import 'package:flutter/material.dart';
import 'package:flutterdjango/controllers/teacher.dart';

class TeacherPage extends StatelessWidget {
  const TeacherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

Future main() async {
  final json = await fetchTeacher();
  print(json);
}
