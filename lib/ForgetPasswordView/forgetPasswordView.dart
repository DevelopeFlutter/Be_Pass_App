// ignore_for_file: file_names

import 'package:be_pass/ForgetPasswordView/resetPassword.dart';
import 'package:be_pass/ForgetPasswordView/textformfield.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_Colors.dart';
import 'auth_controller.dart';

class ForgetPasswordView extends StatefulWidget {
  static const routeName = "forgot-password-screen";
  const ForgetPasswordView({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  AuthController controller = Get.put(AuthController());
  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 30, 0, 0),
              child: Image(
                image: AssetImage("assets/logo.png"),
                height: 60,
              ),
            ),
          ),
          const SizedBox(
            height: 150,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 5, 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Text(
                    "Forget Password ?",
                    style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black),
                  ),
                  const Icon(
                    Icons.key,
                    color: AppColors.starColor,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Text(
              "Enter your email and we will send you instructions to reset your password.",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: AppColors.greyText,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Column(
            children: [
              textformfeild(
                  isObscureText: false,
                  boolTitleShowHide: true,
                  fieldName: "Email",
                  hint_text: "johndoe@gmail.com",
                  returnDatacall: (val) {
                    controller.email.value = val;
                  },
                  onchanged: (val) {
                    validateEmail(val);
                  }),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 20),
                  child: Text(
                    _errorMessage,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
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
                  child: Text('Send Reset Link',
                      style: GoogleFonts.poppins(
                          fontSize: 20, fontWeight: FontWeight.w400)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {
                    // Navigator.of(context).pop();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.gradientGreen,
                        size: 18,
                      ),
                      Text(
                        "Back to login",
                        style:
                            GoogleFonts.poppins(color: AppColors.gradientGreen),
                      )
                    ],
                  ))
            ],
          )
        ]));
  }

  void validateEmail(String val) {
    if (val.isEmpty) {
      setState(() {
        _errorMessage = "Enter Email";
      });
    } else if (!EmailValidator.validate(val, true)) {
      setState(() {
        _errorMessage = "Invalid Email Address";
      });
    } else {
      setState(() {
        _errorMessage = "";
      });
    }
  }
}
