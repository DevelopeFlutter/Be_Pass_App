// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(237, 237, 237, 1),
      body: AnimatedSplashScreen(
        splash: Container(
            height: 250, width: 250, child: Image.asset("assets/img.svg")),
        nextScreen: HomeScreen(),
        duration: 3000,
        splashIconSize: 1000,
        backgroundColor: Color.fromRGBO(237, 237, 237, 1),
        splashTransition: SplashTransition.fadeTransition,
        centered: true,
      ),
    );
  }
}
