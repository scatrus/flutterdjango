import 'package:flutter/material.dart';
import 'package:flutterdjango/views/login_page.dart';
import 'package:flutterdjango/views/student_page.dart';
import 'package:flutterdjango/views/teacher_page.dart';
import 'package:flutterdjango/views/calendar.dart';
import 'package:get/get.dart';

import '../controllers/academycontroller.dart';
import 'calendar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AcademyController academyController = Get.put(AcademyController());
  int _currentIndex = 0;

  List<Widget> pages = [
    const Calendar(),
    StudentPage(),
    TeacherPage(),

    // SizedBox(
    //   child: FutureBuilder(
    //     builder: (context, snapshot) => const Text('teste'),
    //     future: Get.to(const Calendar()),
    //   ),
    // ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // backgroundColor: const Color.fromRGBO(80, 49, 85, 1),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(academyController.academyList[0].name),
            IconButton(
                icon: const Icon(Icons.logout_sharp),
                tooltip: 'Sair',
                onPressed: () {
                  Get.to(
                    LoginPage(),
                  );
                }),
          ],
        ),
      ),
      body: Center(
        child: pages[_currentIndex],
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Colors.white.withOpacity(0.5),
        ),
        child: NavigationBar(
          backgroundColor: Colors.deepPurple,
          animationDuration: const Duration(seconds: 1),
          // labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          height: 80,
          selectedIndex: _currentIndex,
          onDestinationSelected: (int newIndex) {
            setState(
              () {
                _currentIndex = newIndex;
              },
            );
          },
          destinations: const [
            NavigationDestination(
              selectedIcon: Icon(Icons.schedule),
              icon: Icon(Icons.schedule_outlined),
              label: 'Agenda',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.group),
              icon: Icon(Icons.group_outlined),
              label: 'Aluno',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.school),
              icon: Icon(Icons.school_outlined),
              label: 'Professor',
            ),
          ],
        ),
      ),
    );
  }
}
