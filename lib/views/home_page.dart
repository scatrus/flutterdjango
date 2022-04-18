import 'package:flutter/material.dart';
import 'package:flutterdjango/views/TeacherPage.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bem-Vindo!'),
      ),
      body: Column(
        children: [
          const Text('Login'),
          ElevatedButton(
            onPressed: () => Get.to(const TeacherPage()),
            child: const Text('Professores'),
          )
        ],
      ),
    );
  }
}
