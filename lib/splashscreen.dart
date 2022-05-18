import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import './home.dart';

class MySplash extends StatefulWidget {
  @override
  State<MySplash> createState() => _MySplashState();
}

class _MySplashState extends State<MySplash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      navigateAfterSeconds: Home(),
      title: Text(
        'Cat v/s Dog Detector',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
          color: Colors.yellowAccent,
        ),
      ),
      image: Image.asset('assets/cat_dog_icon.png'),
      backgroundColor: Colors.blueAccent,
      photoSize: 60,
      loaderColor: Colors.redAccent,
    );
  }
}
