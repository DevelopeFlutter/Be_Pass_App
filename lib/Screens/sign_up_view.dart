// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:be_pass/Screens/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../ForgetPasswordView/auth_controller.dart';
import '../ForgetPasswordView/textformfield.dart';
import '../app_Colors.dart';

class SignUpView extends StatefulWidget {
  static const routeName = "sign-up";
  SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  AuthController controller = Get.put(AuthController());
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Image.asset("assets/logo.png", height: 60, width: 60),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Text(
                      "Adventure starts here",
                      style: GoogleFonts.poppins(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: AppColors.boldTextColor),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 0, 10),
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/smiling-face-with-heart-eyes.png"),
                              fit: BoxFit.fill),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text("Make your app management easy and fun!",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.greyText)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                textformfeild(
                  isObscureText: false,
                  boolTitleShowHide: true,
                  fieldName: "Username",
                  hint_text: "johndoe",
                  returnDatacall: (val) {
                    controller.email.value = val;
                  },
                ),
                textformfeild(
                  isObscureText: false,
                  boolTitleShowHide: true,
                  fieldName: "Email",
                  hint_text: "johndoe@gmail.com",
                  returnDatacall: (val) {
                    controller.email.value = val;
                  },
                ),
                textformfeild(
                  isObscureText: true,
                  boolTitleShowHide: true,
                  fieldName: "Password",
                  hint_text: ".........",
                  icon: Icons.remove_red_eye_outlined,
                  returnDatacall: (val) {
                    controller.email.value = val;
                  },
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 5),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          height: 20,
                          width: 20,
                          child: Checkbox(
                            value: this.value,
                            onChanged: (bool? value) {
                              setState(() {
                                this.value = value!;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    RichText(
                        text: TextSpan(
                            text: "I agree to",
                            style: GoogleFonts.poppins(
                                fontSize: 14, color: AppColors.greyText),
                            children: <TextSpan>[
                          TextSpan(
                              text: "Terms of Services",
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: AppColors.gradientGreen,
                                  decoration: TextDecoration.underline,
                                  letterSpacing: 1)),
                          TextSpan(
                              text: "&",
                              style: GoogleFonts.poppins(
                                  fontSize: 14, color: AppColors.greyText)),
                          TextSpan(
                              text: "Privacy Policy",
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: AppColors.gradientGreen,
                                decoration: TextDecoration.underline,
                              ))
                        ]))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 45,
                  width: 350,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                      backgroundColor:
                          MaterialStateProperty.all(AppColors.gradientGreen),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const LoginView()));
                    },
                    child: Text('Login',
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: AppColors.white)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.greyText),
                    ),
                    TextButton(
                      child: Text(
                        "Sign in instead",
                        style: GoogleFonts.poppins(fontSize: 16),
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(height: 1.5, width: 150, color: Colors.black26),
                      Text(
                        "or",
                        style: GoogleFonts.poppins(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                      Container(
                        height: 1.5,
                        width: 150,
                        color: Colors.black26,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 80,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Card(
                        child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 40, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset("assets/google-icon.png",
                              height: 60, width: 60),
                          Text(
                            "Sign in with Google",
                            softWrap: true,
                            style: GoogleFonts.poppins(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: AppColors.greyText),
                          )
                        ],
                      ),
                    )),
                  ),
                )
              ],
            )
          ]),
        ));
  }
}
