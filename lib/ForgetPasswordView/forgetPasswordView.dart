import 'package:be_pass/ForgetPasswordView/resetPassword.dart';
import 'package:be_pass/Widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../app_Colors.dart';
import '../Authentication/Controller/auth_controller.dart';
import '../Authentication/Components/textformfield.dart';

class ForgetPasswordView extends StatefulWidget {
  static const routeName = "forgot-password";
  const ForgetPasswordView({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  AuthController controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(children: [
          SizedBox(
            height: 70,
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: SvgPicture.asset("assets/splash-img.svg",
                    color: AppColors.gradientGreen,height: 70,width: 50,)),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 5, 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Text(
                    "Forget Password ? ",
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
          // const SizedBox(
          //   height: 30,
          // ),
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
              ),
              // const SizedBox(
              //   height: 20,
              // ),
              Container(
                height: 00,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: CustomButton(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ResetPasswordView()));
                  },
                  buttonText: "Send Reset Link",
                  textColor: AppColors.white,
                ),
              ),
              // const SizedBox(
              //   height: 20,
              // ),
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
}
