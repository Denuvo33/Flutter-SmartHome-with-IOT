import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_home/controller/home_controller.dart';

// ignore: must_be_immutable
class LightPage extends StatelessWidget {
  var controller = Get.find<HomeController>();
  LightPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Light'),
      ),
      body: Container(
        margin: EdgeInsets.all(7),
        child: Center(
          child: Obx(
            () => ListTile(
              leading: Switch(
                  value: controller.light.value,
                  onChanged: (value) {
                    controller.changeLight(value ? 'on' : 'off');
                  }),
              title: Text('Light is ${controller.light.value ? 'on' : 'off'}'),
            ),
          ),
        ),
      ),
    );
  }
}
