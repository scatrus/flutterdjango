import 'package:flutter/material.dart';
import 'package:flutterdjango/views/home_page.dart';
import 'package:flutterdjango/views/login_page.dart';
import 'package:flutterdjango/views/student_page.dart';
import 'package:flutterdjango/views/teacher_page.dart';
import 'package:get/get.dart';

import 'views/calendar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      // home: LoginPage(),
      theme: ThemeData.from(
        colorScheme: const ColorScheme.dark(),
      ),
      getPages: [
        GetPage(name: '/home', page: () => const HomePage()),
        GetPage(name: '/login', page: () => const LoginPage()),
        GetPage(name: '/calendar', page: () => const Calendar()),
        GetPage(name: '/student', page: () => StudentPage()),
        GetPage(name: "/teacher", page: () => TeacherPage()),
      ],
    );
  }
}
