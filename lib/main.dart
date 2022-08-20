// ignore_for_file: prefer_const_constructors, unused_import

import 'dart:developer';

import 'package:be_pass/ForgetPasswordView/resetPassword.dart';
import 'package:be_pass/Screens/home_screen.dart';
import 'package:be_pass/Screens/login_view.dart';
import 'package:be_pass/Screens/services.dart';
import 'package:be_pass/Screens/sign_up_view.dart';
import 'package:be_pass/Screens/user_card.dart';
import 'package:be_pass/Screens/working_hours.dart';
import 'package:be_pass/Widgets/bottom_nav.dart';
import 'package:be_pass/test.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ForgetPasswordView/forgetPasswordView.dart';
import 'Screens/generl_profile_screen.dart';
import 'Screens/landingPageView.dart';
import 'Screens/profile_screen.dart';
import 'app_Colors.dart';
import 'Screens/splash_screen.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        primarySwatch: generateMaterialColor(AppColors.gradientGreen),
      ),
      home: BottomBar(),
      routes: {
        GenProfile.routeName: (ctx) => GenProfile(),
        Profile.routeName: (ctx) => Profile(false),
        ForgetPasswordView.routeName: (ctx) => ForgetPasswordView(),
        ResetPasswordView.routeName: (ctx) => ResetPasswordView(),
        LandingPageView.routeName: (ctx) => LandingPageView(true),
        SignUpView.routeName: (ctx) => SignUpView(),
        LoginView.routeName: (ctx) => LoginView(),
        ServicesScreen.routeName: (ctx) => ServicesScreen(),
      },
    );
  }
}

MaterialColor generateMaterialColor(Color color) {
  return MaterialColor(color.value, {
    50: tintColor(color, 0.9),
    100: tintColor(color, 0.8),
    200: tintColor(color, 0.6),
    300: tintColor(color, 0.4),
    400: tintColor(color, 0.2),
    500: color,
    600: shadeColor(color, 0.1),
    700: shadeColor(color, 0.2),
    800: shadeColor(color, 0.3),
    900: shadeColor(color, 0.4),
  });
}

int tintValue(int value, double factor) =>
    max(0, min((value + ((255 - value) * factor)).round(), 255));

Color tintColor(Color color, double factor) => Color.fromRGBO(
    tintValue(color.red, factor),
    tintValue(color.green, factor),
    tintValue(color.blue, factor),
    1);

int shadeValue(int value, double factor) =>
    max(0, min(value - (value * factor).round(), 255));

Color shadeColor(Color color, double factor) => Color.fromRGBO(
    shadeValue(color.red, factor),
    shadeValue(color.green, factor),
    shadeValue(color.blue, factor),
    1);
