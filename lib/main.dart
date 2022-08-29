// ignore_for_file: prefer_const_constructors, unused_import

import 'dart:developer';
import 'package:be_pass/ForgetPasswordView/resetPassword.dart';
import 'package:be_pass/Screens/bio_screen.dart';
import 'package:be_pass/Screens/certificates_screen.dart';
import 'package:be_pass/Screens/changeEmail.dart';
import 'package:be_pass/Screens/changePassword.dart';
import 'package:be_pass/Screens/changeUserName.dart';
import 'package:be_pass/Screens/credits_screen.dart';
import 'package:be_pass/Screens/filters_screen.dart';
import 'package:be_pass/Screens/home_screen.dart';
import 'package:be_pass/Screens/language_screen.dart';
import 'package:be_pass/Screens/social_screen.dart';
import 'package:be_pass/Screens/time_currency.dart';
import 'package:be_pass/Authentication/View/login_view.dart';
import 'package:be_pass/Screens/services.dart';
import 'package:be_pass/Authentication/View/sign_up_view.dart';
import 'package:be_pass/Screens/user_card.dart';
import 'package:be_pass/Screens/working_hours.dart';
import 'package:be_pass/Widgets/bottom_nav.dart';
import 'package:be_pass/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ForgetPasswordView/forgetPasswordView.dart';
import 'Screens/generl_profile_screen.dart';
import 'Screens/landingPageView.dart';
import 'Screens/profile_screen.dart';
import 'Screens/working_areas.dart';
import 'app_Colors.dart';
import 'Screens/splash_screen.dart';
import 'dart:math';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

TextEditingController bla = TextEditingController();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        primarySwatch: generateMaterialColor(AppColors.gradientGreen),
      ),
      home: ChangeUserName(),
      builder: EasyLoading.init(),
      routes: {
        GenProfile.routeName: (ctx) => GenProfile(),
        Profile.routeName: (ctx) => Profile(false),
        ForgetPasswordView.routeName: (ctx) => ForgetPasswordView(),
        ResetPasswordView.routeName: (ctx) => ResetPasswordView(),
        LandingPageView.routeName: (ctx) => LandingPageView(true),
        LoginView.routeName: (ctx) => LoginView(),
        ServicesScreen.routeName: (ctx) => ServicesScreen(),
        CertificatesScreen.routeName: (ctx) => CertificatesScreen(),
        BioScreen.routeName: (ctx) => BioScreen(),
        SocialScreen.routeName: (ctx) => SocialScreen(),
        WorkingHours.routeName: (ctx) => WorkingHours(),
        WorkingAreas.routeName: (ctx) => WorkingAreas(),
        CreditsScreen.routeName: (ctx) => CreditsScreen(),
        CurrencyTimeScreen.routeName: (ctx) => CurrencyTimeScreen(),
        LanguageScreen.routeName: (ctx) => LanguageScreen(),
        SignUpView.routeName: (ctx) => SignUpView(),
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
