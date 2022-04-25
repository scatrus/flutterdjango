import 'package:flutter/material.dart';
import 'package:flutterdjango/views/home_page.dart';
import 'package:flutterdjango/views/login_page.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _toHome();
  }

  _toHome() async {
    await Future.delayed(const Duration(seconds: 2), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: ((context) => const LoginPage()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Column(
                children: const [
                  Icon(
                    Icons.sports_kabaddi,
                    size: 100,
                  ),
                  CircularProgressIndicator(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
