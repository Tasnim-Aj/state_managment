import 'dart:async';

import 'package:flutter/material.dart';
import 'package:state_managment/view/clock_page.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   // ConfigSetup().setup();
//   runApp(MaterialApp(
//     home: ProductsPage(),
//   ));
// }

late StreamController controller;

void main() {
  controller = StreamController();
  controller.stream.listen((value) {
    print(value);
  });
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ClockPage(),
    );
  }
}
