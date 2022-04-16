import 'package:flutter/material.dart';
import 'package:flutterdjango/controllers/academycontroller.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final AcademyController academyController = Get.put(AcademyController());

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Obx(
          () {
            if (academyController.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
              itemCount: academyController.academyList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  selected: true,
                  selectedTileColor: Colors.blue[100],
                  leading: const Icon(Icons.sports_kabaddi),
                  title: Text(academyController.academyList[index].name),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
