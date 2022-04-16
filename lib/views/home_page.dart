import 'package:flutter/material.dart';
import 'package:flutterdjango/controllers/academycontroller.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

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
        child: Center(
          child: ListView.builder(
            itemCount: academyController.academyList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(academyController.academyList[index].name),
              );
            },
          ),
        ),
      ),
    );
  }
}
