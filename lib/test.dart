import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ForgetPasswordView/auth_controller.dart';
import 'app_Colors.dart';

AuthController controller = Get.put(AuthController());
Widget textformfeild({
  required isObscureText,
  required boolTitleShowHide,
  required fieldName,
  hint_text,
  icon,
  padding,
  required Function returnDatacall,

  // Function
}) {
  return Container(
    height: boolTitleShowHide ? 105 : 92,
    padding: padding ??
        const EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        boolTitleShowHide
            ? Text(
                fieldName,
                style: GoogleFonts.poppins(
                    color: AppColors.greyText,
                    fontWeight: FontWeight.w400,
                    fontSize: 16),
              )
            : Container(
                height: 10,
              ),
        SizedBox(
          height: 80,
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "$fieldName  Required";
              }
              if (fieldName == "email" || fieldName == "Email") {
                if (!value.contains("@")) {
                  return ("Email must be valid");
                }
                return null;
              }
            },
            obscureText:
                isObscureText == true ? controller.isObscureText.value : false,
            style: GoogleFonts.poppins(),
            decoration: InputDecoration(
              suffixIcon: Icon(icon),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              hintStyle:
                  const TextStyle(fontSize: 14, color: AppColors.greyText),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: AppColors.greyText, width: 2.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              hintText: hint_text,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: AppColors.greyText)),
              helperStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        )
      ],
    ),
  );
}
