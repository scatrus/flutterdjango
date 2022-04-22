import 'package:flutter/material.dart';
import 'package:flutterdjango/views/login_page.dart';
import 'package:flutterdjango/views/student_page.dart';
import 'package:flutterdjango/views/teacher_page.dart';
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
  int currentIndex = 0;
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
              icon: Icon(Icons.logout_sharp),
              tooltip: 'Sair',
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: currentIndex == 0
          ? const Calendar()
          : currentIndex == 1
              ? StudentPage()
              : currentIndex == 2
                  ? TeacherPage()
                  : const Text(''),

      // Navigator.of(context).push(
      //                 MaterialPageRoute(
      //                   builder: (context) => AcademyPage(),
      //                 ),
      //               )

      // Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       ElevatedButton(
      //         // style: ElevatedButton.styleFrom(
      //         //   primary: const Color.fromARGB(255, 203, 210, 214),
      //         //   onPrimary: Color.fromARGB(255, 119, 28, 99),
      //         // ),
      //         onPressed: () {
      //           Navigator.of(context).push(
      //             MaterialPageRoute(
      //               builder: (context) => AcademyPage(),
      //             ),
      //           );
      //         },
      //         child: const Text('Academia'),
      //       ),
      //       ElevatedButton(
      //         // style: ElevatedButton.styleFrom(
      //         //   primary: const Color.fromARGB(255, 203, 210, 214),
      //         //   onPrimary: Color.fromARGB(255, 119, 28, 78),
      //         // ),
      //         onPressed: () {
      //           Navigator.of(context).push(
      //             MaterialPageRoute(
      //               builder: (context) => TeacherPage(),
      //             ),
      //           );
      //         },
      //         child: const Text('Professores'),
      //       ),
      //     ],
      //   )

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.purple,
        items: const [
          BottomNavigationBarItem(
            label: 'Agenda',
            icon: Icon(Icons.schedule),
          ),
          BottomNavigationBarItem(
            label: 'Aluno',
            icon: Icon(Icons.group),
          ),
          BottomNavigationBarItem(
            label: 'Professor',
            icon: Icon(Icons.school),
          ),
        ],
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
