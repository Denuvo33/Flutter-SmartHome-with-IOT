import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:smart_home/controller/home_controller.dart';

class SecurityPage extends StatefulWidget {
  const SecurityPage({super.key});

  @override
  State<SecurityPage> createState() => _SecurityPageState();
}

class _SecurityPageState extends State<SecurityPage> {
  var range = 0;
  var alarm = false;
  var espIP = Get.find<HomeController>().espIP;
  var controller = Get.find<HomeController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 1), (t) {
      if (!mounted) {
        t.cancel();
      } else {
        getData();
      }
    });
  }

  Future<void> getData() async {
    final response = await http.get(Uri.parse('http://$espIP/ultrasonic'));
    if (response.statusCode == 200) {
      setState(() {
        range = int.parse(response.body);
      });
    } else {
      print('error is ${response.body}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Security'),
      ),
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.person_pin_circle,
              size: 100,
              color: Colors.black,
            ),
            Text(
              'People in Range: \n $range Cm',
              style: TextStyle(fontSize: 20),
            ),
            ListTile(
              title: Text('Turn on/off Alarm'),
              leading: Switch(
                  activeColor: Colors.red.shade900,
                  value: alarm,
                  onChanged: (value) {
                    alarm = value;
                    controller.alarmAction();
                    setState(() {});
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
