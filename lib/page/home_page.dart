import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Home'),
      ),
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.all(7),
        child: Wrap(
          spacing: 20,
          children: [
            InkWell(
              onTap: () {
                Get.toNamed('/light');
              },
              child: Card(
                color: Colors.yellow.shade100,
                child: Container(
                  margin: const EdgeInsets.all(7),
                  width: 150,
                  child: Column(
                    children: [
                      Icon(
                        Icons.lightbulb,
                        size: 50,
                        color: Colors.yellow.shade700,
                      ),
                      const Text(
                        'Light',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              color: Colors.purple.shade100,
              child: Container(
                width: 150,
                margin: const EdgeInsets.all(7),
                child: Column(
                  children: [
                    Icon(
                      Icons.camera,
                      size: 50,
                      color: Colors.black,
                    ),
                    const Text(
                      'Camera',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              color: Colors.green.shade100,
              child: Container(
                width: 150,
                margin: const EdgeInsets.all(7),
                child: Column(
                  children: [
                    Icon(
                      Icons.health_and_safety_rounded,
                      size: 50,
                      color: Colors.green,
                    ),
                    const Text(
                      'Health',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.toNamed('/weather');
              },
              child: Card(
                color: Colors.blue.shade100,
                child: Container(
                  width: 150,
                  margin: const EdgeInsets.all(7),
                  child: Column(
                    children: [
                      Icon(
                        Icons.cloud,
                        size: 50,
                        color: Colors.blue,
                      ),
                      const Text(
                        'Weather',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.toNamed('/security');
              },
              child: Card(
                color: Colors.red.shade100,
                child: Container(
                  width: 150,
                  margin: const EdgeInsets.all(7),
                  child: Column(
                    children: [
                      Icon(
                        Icons.security_rounded,
                        size: 50,
                        color: Colors.red,
                      ),
                      const Text(
                        'Security',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
