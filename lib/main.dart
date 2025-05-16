import 'dart:async';

import 'package:flutter/material.dart';
import 'package:state_managment/view/clock_page.dart';

late StreamController controller;

void main() {
  controller = StreamController();
  controller.stream.listen((value) {
    print(value);
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ClockPage(),
    );
  }
}
