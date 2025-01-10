import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../controller/home_controller.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  String temp = '';
  String hum = '';
  var espIP = Get.find<HomeController>().espIP;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (Timer t) {
      if (!mounted) {
        t.cancel();
      } else {
        getData();
      }
    });
  }

  Future<void> getData() async {
    final response = await http.get(Uri.parse('http://$espIP/dht'));
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      debugPrint('get Data');
      if (!context.mounted) return;
      setState(() {
        temp = result['temp'].toString();
        hum = result['hum'].toString();
      });
    } else {
      debugPrint(response.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Page'),
      ),
      body: Center(
        child: temp == '' || hum == ''
            ? const CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.wb_sunny,
                    size: 100,
                    color: Colors.yellow,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    '$temp °C',
                    style: TextStyle(fontSize: 20),
                  ),
                  const Icon(
                    Icons.heat_pump,
                    size: 100,
                    color: Colors.cyan,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    '$hum %',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
      ),
    );
  }
}
