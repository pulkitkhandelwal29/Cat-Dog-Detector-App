import 'package:flutter/material.dart';
import './splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cat-Dog Detector',
      home: MySplash(),
      //removes the debug banner
      debugShowCheckedModeBanner: false,
    );
  }
}
