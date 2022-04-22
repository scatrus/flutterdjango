import 'package:flutter/material.dart';
import 'package:flutterdjango/controllers/studentcontroller.dart';
import 'package:get/get.dart';

class StudentPage extends StatelessWidget {
  final StudentController studentController = Get.put(StudentController());

  StudentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text('Aluno'),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Obx(
          () {
            if (studentController.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
              itemCount: studentController.studentList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  selected: true,
                  // selectedTileColor: Color.fromARGB(255, 251, 187, 224),
                  leading: const Icon(Icons.sports_kabaddi),
                  title: Center(
                      child: Text(studentController.studentList[index].email)),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
