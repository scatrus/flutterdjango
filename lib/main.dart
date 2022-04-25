import 'package:flutter/material.dart';
import 'package:flutterdjango/views/home_page.dart';
import 'package:flutterdjango/views/login_page.dart';
import 'package:flutterdjango/views/splash_screen.dart';
import 'package:flutterdjango/views/student_page.dart';
import 'package:flutterdjango/views/teacher_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'views/calendar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GetStorage box = GetStorage();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      // home: LoginPage(),
      theme: ThemeData.from(
        colorScheme: const ColorScheme.dark(),
      ),
      getPages: [
        GetPage(
            name: '/',
            page: () {
              return box.hasData('token')
                  ? const HomePage()
                  : const LoginPage();
            }),
        // GetPage(name: '/home', page: () => const HomePage()),
        // GetPage(name: '/login', page: () => const LoginPage()),
        GetPage(name: '/calendar', page: () => const Calendar()),
        GetPage(name: '/student', page: () => StudentPage()),
        GetPage(name: "/teacher", page: () => TeacherPage()),
        GetPage(name: "/splash", page: () => const SplashScreen()),
      ],
    );
  }
}
