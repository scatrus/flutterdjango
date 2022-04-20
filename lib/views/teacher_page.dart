import 'package:flutter/material.dart';
import 'package:flutterdjango/controllers/teachercontroller.dart';
import 'package:get/get.dart';

class TeacherPage extends StatelessWidget {
  final TeacherController teacherController = Get.put(TeacherController());

  TeacherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Professores'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Obx(
          () {
            if (teacherController.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
              itemCount: teacherController.teacherList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  selected: true,
                  // selectedTileColor: Color.fromARGB(255, 251, 187, 224),
                  leading: const Icon(Icons.sports_kabaddi),
                  title: Text(teacherController.teacherList[index].firstName),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
