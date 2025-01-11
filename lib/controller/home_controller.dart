import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  var light = false.obs;
  var alarm = false.obs;
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

  void alarmAction() async {
    final response = await http.get(Uri.parse('http://$espIP/buzzer/action'));
    if (response.statusCode == 200) {
      alarm.value = !alarm.value;
    } else {
      Get.snackbar(
          'Error', 'Failed to turn alarm ${alarm.value ? 'on' : 'off'}');
    }
  }

  void changeLight(String path) async {
    final response = await http.get(Uri.parse('http://$espIP/led/$path'));
    if (response.statusCode == 200) {
      light.value = !light.value;
      //  Get.snackbar('Success', 'LED turned ${light.value ? 'on' : 'off'}');
    } else {
      Get.snackbar('Error', 'Failed to turn LED ${light.value ? 'on' : 'off'}');
    }
  }
}
