// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_Colors.dart';
import 'auth_controller.dart';

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
    height: boolTitleShowHide ? 110 : 92,
    padding: padding ?? EdgeInsets.symmetric(horizontal: 15),
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
              }
              return null;
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
                  borderSide: BorderSide(color: AppColors.greyText)),
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
