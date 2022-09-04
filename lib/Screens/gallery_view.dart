// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:be_pass/app_Colors.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import '../Widgets/custom_button_widget.dart';

class GalleryScreenView extends StatefulWidget {
  static const routeName = "certificate-screen";
  GalleryScreenView({Key? key}) : super(key: key);

  @override
  State<GalleryScreenView> createState() => _GalleryScreenViewState();
}

class _GalleryScreenViewState extends State<GalleryScreenView> {
  List<Widget> certificateList = [];
  void _addCard() {
    setState(() {
      certificateList.add(certificateCard(context, _removeCard));
    });
  }

  void _removeCard() {
    setState(() {
      if (certificateList.isNotEmpty) {
        certificateList.removeLast();
      }
    });
  }
  // @override
  // void initState() {
  //   super.initState();
  //   _addCard();
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          icon: Icon(Icons.arrow_back_ios),
                          onPressed: () {
                            Navigator.of(context).pop();
                          }),
                      Text("Gallery",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(right: 70),
                        child: Text(""),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 1.3,
            width: double.infinity,
            child: ListView.builder(
              itemCount: certificateList.length,
              itemBuilder: (BuildContext context, int index) {
                return certificateCard(context, _removeCard);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: InkWell(
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: Radius.circular(5),
                  dashPattern: [10, 10],
                  color: AppColors.greenishText,
                  strokeWidth: 2,
                  child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Add gallery +",
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: AppColors.greenishText),
                      )),
                ),
              ),
              onTap: () {
                _addCard();
              },
            ),
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 40,
            width: 148,
            child: CustomButton(
                    textColor: AppColors.white,
                    borderRadius: 16,
                    onTap: () {},
                    buttonText: "Save Changes")
                .pSymmetric(),
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    ));
  }
}

Column certificateCard(BuildContext context, void Function() remove) {
  return Column(
    children: [
      // main container
      Padding(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.greyText,
              ),
              borderRadius: BorderRadius.circular(10)),
          height: MediaQuery.of(context).size.height / 1.7,
          width: double.infinity,
          child:
              // inside main container where image and drop button placed
              Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Gallery 1",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: AppColors.greyText,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                ).pOnly(top: 20, left: 10),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter your username',
                  ),
                ),
              ),
              Expanded(
                child: ImageSel(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: remove,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text("Delete Category",
                          style: GoogleFonts.poppins(
                            textStyle:
                                TextStyle(color: AppColors.red, fontSize: 16),
                          )).pOnly(right: 8),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  )
                ],
              )
            ],
          ),
        ).pOnly(top: 12),
      ),
      SizedBox(height: 20)
    ],
  );
}

class ImageSel extends StatefulWidget {
  @override
  State<ImageSel> createState() => _ImageSelState();
}

class _ImageSelState extends State<ImageSel> {
  final ImagePicker imagePicker = ImagePicker();

  List<XFile>? imageFile = [];

  List Index = [
    {"asd"},
    {"dfr"}
  ];
  void getImageFromGallery() async {
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    setState(() {
      if (selectedImages != null) {
        imageFile!.addAll(selectedImages);
      }
    });
  }

  void _removeImage() {
    setState(() {
      if (imageFile!.isNotEmpty) {
        imageFile!.removeLast();
      }
    });
  }

  // void initState() {
  //   super.initState();
  //   imageFile!.add(XFile();
  // }
  @override
  Widget build(BuildContext context) {
    int length = imageFile!.length + 1;
    print('length === ${length}');
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: 300,
          // color: AppColors.greyText,
          width: double.infinity,
          child: GridView.count(
            crossAxisCount: 4,
            children: List.generate(length, (index) {
              bool show = length == index + 1;
              return !show
                  ? SizedBox(
                      height: 120,
                      width: 120,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: [
                            Image.file(
                              File(
                                imageFile![index].path,
                              ),
                              height: 60,
                              width: 80,
                              fit: BoxFit.fill,
                            ),
                            Positioned(
                                top: 0,
                                right: 0,
                                child: InkWell(
                                  child: Container(
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        // color: AppColors.gradientGreen,
                                        image: const DecorationImage(
                                            image: AssetImage("assets/X.png")),
                                      )),
                                  onTap: () {
                                    _removeImage();
                                  },
                                )),
                          ],
                        ),
                      ))
                  : GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(14, 10, 16, 20),
                        child: DottedBorder(
                            borderType: BorderType.RRect,
                            radius: Radius.circular(5),
                            dashPattern: [10, 10],
                            color: AppColors.greenishText,
                            strokeWidth: 2,
                            child: Align(
                                alignment: Alignment.center,
                                child: Image.asset("assets/upload-image.png"))),
                      ),
                      onTap: () {
                        getImageFromGallery();
                      },
                    );
            }),
          ),
        ),
      ],
    ));
  }
}
