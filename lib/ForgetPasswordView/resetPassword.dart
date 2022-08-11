// ignore_for_file: file_names

import 'package:be_pass/ForgetPasswordView/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_Colors.dart';
import 'auth_controller.dart';

class ResetPasswordView extends StatefulWidget {
  static const routeName = "reset-pass";
  const ResetPasswordView({Key? key}) : super(key: key);

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  AuthController controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                "Reset Password ?",
                style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black),
              ),
              const Icon(
                Icons.lock_clock_outlined,
                color: AppColors.starColor,
              )
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Text(
          "Your new password must be different from previously used passwords",
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
            fieldName: "New Password",
            isObscureText: true,
            boolTitleShowHide: true,
            hint_text: "Password",
            returnDatacall: (val) {
              controller.password.value = val;
            },
          ),
          textformfeild(
            fieldName: "Confirm Password",
            isObscureText: true,
            boolTitleShowHide: true,
            hint_text: "Password",
            returnDatacall: (val) {
              controller.confirmPassword.value = val;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 40,
            width: 350,
            child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                )),
                backgroundColor:
                    MaterialStateProperty.all(AppColors.gradientGreen),
              ),
              onPressed: () {
                // if (_formKey.currentState!.validate()) {
                //
                //   Navigator.of(context).push(MaterialPageRoute(
                //       builder: (context) => ResetPassword()));
                // }
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
                Navigator.of(context).pop();
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
                    style: GoogleFonts.poppins(color: AppColors.gradientGreen),
                  )
                ],
              ))
        ],
      )
    ]));
  }
}
