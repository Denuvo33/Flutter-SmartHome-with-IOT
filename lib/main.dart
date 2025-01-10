import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:smart_home/controller/home_controller.dart';
import 'package:smart_home/page/home_page.dart';
import 'package:smart_home/page/light_page.dart';
import 'package:smart_home/page/security_page.dart';
import 'package:smart_home/page/weather_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  Get.put(HomeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/light': (context) => LightPage(),
        '/weather': (context) => WeatherPage(),
        '/security': (context) => SecurityPage(),
      },
    );
  }
}
