import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  var light = false.obs;
  final String espIP = dotenv.env['ESP32IP']!;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initLight();
  }

  void initLight() async {
    final response = await http.get(Uri.parse('http://$espIP/led'));
    try {
      if (response.statusCode == 200) {
        light.value = response.body == '1';
      }
    } catch (e) {
      print('error is $e');
    }
  }

  void changeLight(String path) async {
    final response = await http.get(Uri.parse('http://$espIP/led/$path'));
    if (response.statusCode == 200) {
      debugPrint('response is ${response.body}');
      light.value = !light.value;
      //  Get.snackbar('Success', 'LED turned ${light.value ? 'on' : 'off'}');
    } else {
      Get.snackbar('Error', 'Failed to turn LED ${light.value ? 'on' : 'off'}');
    }
  }
}
