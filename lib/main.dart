import 'package:caloria/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:caloria/controllers/navigation.dart';
import 'package:get/instance_manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // Register navigation state
  final NavigationState navigation = Get.put(NavigationState());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
