import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'academy.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Academy Manager'),
      ),
      body: Center(
        child: currentIndex == 0
            ? Container(
                color: const Color(0xFFE9EAEB),
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 203, 210, 214),
                          onPrimary: const Color.fromARGB(255, 28, 49, 119)),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const Academy(),
                          ),
                        );
                      },
                      child: const Text('Academia'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          Get.snackbar('Hi', 'Mensagem');
                          // Get.defaultDialog(title: '...');
                        });
                      },
                      child: const Text('Clicar'),
                    ),
                  ],
                ),
              )
            : Image.asset('images/img.png'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home_rounded),
          ),
          BottomNavigationBarItem(
            label: 'Academia',
            icon: Icon(Icons.sports_kabaddi),
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
