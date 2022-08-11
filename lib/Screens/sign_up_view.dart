// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../ForgetPasswordView/auth_controller.dart';
import '../ForgetPasswordView/resetPassword.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 232, 232, 232),
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
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54),
                    ),
                    const Icon(
                      Icons.rocket_launch,
                      color: AppColors.starColor,
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
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.white)),
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
                          builder: (context) => const ResetPasswordView()));
                    },
                    child: Text('Sign up',
                        style: GoogleFonts.poppins(
                            fontSize: 20, fontWeight: FontWeight.w400)),
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
                          Image.asset("assets/logo.png", height: 60, width: 60),
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