// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';
import 'package:be_pass/app_Colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocity_x/velocity_x.dart';

class ImageSel extends StatefulWidget {
  @override
  State<ImageSel> createState() => _ImageSelState();
}

class _ImageSelState extends State<ImageSel> {
  ImagePicker _imagePicker = ImagePicker();
  File? imageFile;
  getImageFromGallery() async {
    var imageSource = await _imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageFile = File(imageSource!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        getImageFromGallery();
      },
      child: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.greyText),
            borderRadius: BorderRadius.circular(8)),
        child: imageFile == null
            ? Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            style: BorderStyle.solid,
                            color: AppColors.gradientGreen)),
                    child: Icon(
                      Icons.add,
                      size: 30,
                      color: AppColors.gradientGreen,
                    ),
                  ).pOnly(top: 15, bottom: 5),
                  Text("Add Image")
                ],
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(08),
                child: Image.file(
                  imageFile!,
                  fit: BoxFit.cover,
                ),
              ),
      ),
    );
  }
}
