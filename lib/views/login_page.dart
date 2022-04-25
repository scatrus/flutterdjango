// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:flutterdjango/models/api_model.dart';
import 'package:flutterdjango/views/home_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../services/api_connection.dart';
// import 'package:flutterdjango/controllers/teachercontroller.dart';
// import 'package:flutterdjango/services/api_connection.dart';
// import 'package:flutterdjango/views/home_page.dart';
// import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  // final TeacherController teacherController = Get.put(TeacherController());
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userController = TextEditingController();
  final passController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    userController.dispose();
    passController.dispose();

    super.dispose();
  }

  GetStorage box = GetStorage();

  // final userLogin = {"username":userController, "password":passController};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 219, 168, 168),
      // appBar: AppBar(
      //   title: const Center(child: Text("Login Page")),
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 60.0),
              child: Center(
                child: SizedBox(
                  width: 200,
                  height: 150,
                  /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                  child: Icon(
                    Icons.sports_kabaddi_outlined,
                    size: 100,
                  ),
                ),
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: userController,
                decoration: const InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Digite seu email'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: passController,
                obscureText: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Senha',
                    hintText: 'Digite sua senha'),
              ),
            ),
            TextButton(
              onPressed: () {
                //TODO FORGOT PASSWORD SCREEN GOES HERE
              },
              child: const Text(
                'Esqueci minha senha',
                // style: TextStyle(
                //     color: Color.fromARGB(255, 167, 4, 53), fontSize: 15),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 85, 16, 37),
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextButton(
                onPressed: () {
                  box.write(
                    'token',
                    getToken(
                      UserLogin(
                          username: userController.text,
                          password: passController.text),
                    ),
                  );
                  // debugPrint(token);
                  Get.to(() => (const HomePage()));
                },
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            const SizedBox(
              height: 130,
            ),
            ElevatedButton(
              onPressed: () => {},
              child: const Text("Registrar Academia"),
            )
          ],
        ),
      ),
    );
  }
}
