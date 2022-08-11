// ignore_for_file: non_constant_identifier_names

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
  padding,
  required Function returnDatacall,
  onchanged,
  // Function
}) {
  return Container(
    height: boolTitleShowHide ? 85 : 92,
    padding: padding ??
        const EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        boolTitleShowHide
            ? SizedBox(
                height: 28,
                child: Text(
                  fieldName,
                  style: GoogleFonts.poppins(
                      color: AppColors.greyText,
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                ))
            : Container(
                height: 10,
              ),
        SizedBox(
          height: 48,
          child: TextFormField(
            obscureText:
                isObscureText == true ? controller.isObscureText.value : false,
            style: GoogleFonts.poppins(),
            decoration: InputDecoration(
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
            onChanged: onchanged,
          ),
        )
      ],
    ),
  );
}
