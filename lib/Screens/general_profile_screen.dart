// ignore_for_file: prefer_const_constructors, prefer_final_fields, must_be_immutable, unused_field, sort_child_properties_last, sized_box_for_whitespace, camel_case_types

import 'dart:async';

import 'package:be_pass/Authentication/Components/textformfield.dart';
import 'package:be_pass/Screens/gallery_view.dart';
import 'package:be_pass/Widgets/image_select.dart';
import 'package:be_pass/Widgets/profileCustomCard.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_place/google_place.dart';
import 'package:velocity_x/velocity_x.dart';
import '../Widgets/custom_button_widget.dart';
import '../Widgets/text_widget.dart';
import '../app_Colors.dart';

class GenProfile extends StatefulWidget {
  static const routeName = "gen-profile";

  GenProfile({
    Key? key,
  }) : super(key: key);

  @override
  State<GenProfile> createState() => _GenProfileState();
}

class _GenProfileState extends State<GenProfile> {
  TextEditingController _fname = TextEditingController();

  TextEditingController _lname = TextEditingController();

  TextEditingController _textEditingControllerPro = TextEditingController();

  TextEditingController _textEditingControllerSkill = TextEditingController();

  TextEditingController _dob = TextEditingController();

  TextEditingController _loc = TextEditingController();
  List<String> _valuesSkill = [];
  List<bool> _selectedSkill = [];
  List<String> _valuesPro = [];
  List<bool> _selectedPro = [];
  late GooglePlace googlePlace;
  List<AutocompletePrediction> predictions = [];
  Timer? debounce;
  DetailsResult? position;
  late FocusNode locFocusNode;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    String apikey = "AIzaSyCkmpaMPmzhJgTLPh2r_14RB4Je-tX76lw";
    googlePlace = GooglePlace(apikey);
    locFocusNode = FocusNode();
  }

  void autoCompleteSearch(String value) async {
    var result = await googlePlace.autocomplete.get(value);
    if (result != null && result.predictions != null && mounted) {
      print(result.predictions!.first.description);
      setState(() {
        predictions = result.predictions!;
      });
    }
  }

  void dispose() {
    _fname.dispose();
    _lname.dispose();
    _loc.dispose();
    locFocusNode.dispose();
    super.dispose();
  }

  Widget buildChipsPro() {
    List<Widget> chips = [];

    for (int i = 0; i < _valuesPro.length; i++) {
      InputChip actionChip = InputChip(
        selected: _selectedPro[i],
        label: Text(
          _valuesPro[i],
          style: TextStyle(
              color: AppColors.gradientGreen,
              fontWeight: FontWeight.w600,
              fontSize: 12),
        ),
        selectedColor: Color.fromARGB(83, 78, 228, 64),
        deleteIconColor: AppColors.gradientGreen,
        elevation: 10,
        pressElevation: 5,
        shadowColor: Colors.teal,
        onPressed: () {
          setState(() {
            _selectedPro[i] = !_selectedPro[i];
          });
        },
        onDeleted: () {
          _valuesPro.removeAt(i);
          _selectedPro.removeAt(i);

          setState(() {
            _valuesPro = _valuesPro;
            _selectedPro = _selectedPro;
          });
        },
      );

      chips.add(actionChip);
    }
    return GridView(
      // This next line does the trick.
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 120,
          childAspectRatio: 2,
          crossAxisSpacing: 5,
          mainAxisExtent: 50),
      //scrollDirection: Axis.horizontal,
      children: chips,
    );
  }

  Widget buildChipsSkill() {
    List<Widget> chips = [];

    for (int i = 0; i < _valuesSkill.length; i++) {
      InputChip actionChip = InputChip(
        selected: _selectedSkill[i],
        label: Text(
          _valuesSkill[i],
          style: TextStyle(
              color: AppColors.gradientGreen,
              fontWeight: FontWeight.w600,
              fontSize: 12),
        ),
        selectedColor: Color.fromARGB(83, 78, 228, 64),
        deleteIconColor: AppColors.gradientGreen,
        elevation: 10,
        pressElevation: 5,
        shadowColor: Colors.teal,
        onPressed: () {
          setState(() {
            _selectedSkill[i] = !_selectedSkill[i];
          });
        },
        onDeleted: () {
          _valuesSkill.removeAt(i);
          _selectedSkill.removeAt(i);

          setState(() {
            _valuesSkill = _valuesSkill;
            _selectedSkill = _selectedSkill;
          });
        },
      );

      chips.add(actionChip);
    }
    return GridView(
      // This next line does the trick.
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 120,
          childAspectRatio: 2,
          crossAxisSpacing: 5,
          mainAxisExtent: 50),
      //scrollDirection: Axis.horizontal,
      children: chips,
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Add Personal Info",
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
                color: AppColors.black,
                wordSpacing: 1,
                fontSize: 22,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            pInfo(
              title: "Main Image",
              subtitle: "Allowed JPG,GIF,PNG, Max size of 5mb ",
              button: CustomButton(
                  onTap: () {},
                  textColor: AppColors.white,
                  buttonText: "Upload"),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Divider(
                thickness: 1,
                color: Colors.black26,
              ),
            ),
            pInfo(
              title: "Company Logo",
              subtitle: "Allowed JPG,GIF,PNG, Max size of 5mb",
              button: CustomButton(
                  onTap: () {},
                  textColor: AppColors.white,
                  buttonText: "Upload"),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Divider(
                thickness: 1,
                color: Colors.black26,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            textformfeild(
                fieldName: "First Name",
                boolTitleShowHide: true,
                isObscureText: false,
                hint_text: "First Name",
                padding: EdgeInsets.fromLTRB(30, 0, 30, 0)),
            textformfeild(
                fieldName: "Last Name",
                boolTitleShowHide: true,
                isObscureText: false,
                hint_text: "Last Name",
                padding: EdgeInsets.fromLTRB(30, 0, 30, 0)),
            textformfeild(
                fieldName: "Profession",
                boolTitleShowHide: true,
                isObscureText: false,
                hint_text: "Choose Profession",
                padding: EdgeInsets.fromLTRB(30, 0, 30, 0)),
            textformfeild(
                fieldName: "Skills",
                boolTitleShowHide: true,
                isObscureText: false,
                hint_text: "Choose Profession",
                padding: EdgeInsets.fromLTRB(30, 0, 30, 0),

                returnDatacall: (value) {
                  if (debounce?.isActive ?? false) debounce!.cancel();
                  debounce = Timer(Duration(milliseconds: 100), () {
                    if (value.isNotEmpty) {
                      //call place api
                      autoCompleteSearch(value);
                    } else {
                      setState(() {
                        predictions = [];
                        position = null;
                      });
                    }
                  });
                },
            ),
            // Padding(
            //   padding: const EdgeInsets.all(10.0),
            //   child: TextFormField(
            //     onChanged: (value) {
            //       if (debounce?.isActive ?? false) debounce!.cancel();
            //       debounce = Timer(Duration(milliseconds: 100), () {
            //         if (value.isNotEmpty) {
            //           //call place api
            //           autoCompleteSearch(value);
            //         } else {
            //           //shutup
            //           setState(() {
            //             predictions = [];
            //             position = null;
            //           });
            //         }
            //       });
            //     },
            //     focusNode: locFocusNode,
            //     controller: _loc,
            //     decoration: InputDecoration(
            //       suffixIcon: _loc.text.isNotEmpty
            //           ? IconButton(
            //               icon: Icon(Icons.clear_outlined),
            //               onPressed: () {
            //                 predictions = [];
            //                 _loc.clear();
            //               },
            //             )
            //           : null,
            //       hintText: "Search Places",
            //       fillColor: Color.fromARGB(255, 255, 255, 255),
            //       filled: true,
            //       focusedBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(15.0),
            //         borderSide: BorderSide(
            //           color: AppColors.greyText,
            //         ),
            //       ),
            //       enabledBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(15.0),
            //         borderSide: BorderSide(
            //           color: AppColors.greyText,
            //           width: 1.0,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: predictions.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      onTap: () async {
                        final placeId = predictions[index].placeId!.toString();
                        final details = await googlePlace.details.get(placeId);
                        if (details != null &&
                            details.result != null &&
                            mounted) {
                          if (locFocusNode.hasFocus) {
                            setState(() {
                              position = details.result;
                              _loc.text = details.result!.name.toString();
                              predictions = [];
                            });
                          }
                        }
                      },
                      leading: CircleAvatar(
                          backgroundColor: AppColors.gradientGreen,
                          child: Icon(Icons.pin_drop, color: Colors.white)),
                      title: Text(predictions[index].description.toString()));
                }),
            SizedBox(height: 50),
            Container(
              height: 50,
              width: 150,
              child: CustomButton(
                  textColor: AppColors.white,
                  borderRadius: 20,
                  onTap: () {},
                  buttonText: "Save Changes"),
            ),
            SizedBox(height: 30)
          ],
        ),
      ),
    );
  }
}

//list view function
class Listitems extends StatelessWidget {
  final String imagesrc;
  final String titleel;
  const Listitems({
    Key? key,
    required this.imagesrc,
    required this.titleel,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        height: 60,
        width: 60,
        child: Container(
          child: Align(
            alignment: Alignment.topRight,
            child: CircleAvatar(
              backgroundColor: AppColors.red,
              radius: 10.0,
              child: Icon(
                Icons.close,
                size: 15.0,
                color: AppColors.white,
              ),
            ),
          ),
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(imagesrc),
              ),
              borderRadius: BorderRadius.circular(20)),
        ),
      ),
      title: Text(
        titleel,
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
              color: AppColors.black,
              fontWeight: FontWeight.w600,
              fontSize: 16),
        ),
      ).pOnly(top: 10),
      subtitle: Text(
        "Allowed JPG,GIF,PNG, Max size of 800kb",
        style: GoogleFonts.poppins(
          textStyle: TextStyle(color: AppColors.greyText, fontSize: 11),
        ),
      ).pOnly(top: 10),
      trailing: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Container(
          width: 95,
          height: 29.9,
          child: CustomButton(
              onTap: () {},
              borderRadius: 20,
              textColor: AppColors.white,
              buttonText: "Upload"),
        ),
      ),
    );
  }
}

class dividefun extends StatelessWidget {
  const dividefun({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1,
    ).pSymmetric(h: 20);
  }
}

class Newel extends StatelessWidget {
  final String imagesrc;
  final String titleel;
  const Newel({
    Key? key,
    required this.imagesrc,
    required this.titleel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          SizedBox(
            height: 60,
            width: 60,
            child: Container(
              child: Align(
                alignment: Alignment.topRight,
                child: CircleAvatar(
                  backgroundColor: AppColors.red,
                  radius: 10.0,
                  child: Icon(
                    Icons.close,
                    size: 15.0,
                    color: AppColors.white,
                  ),
                ),
              ),
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(imagesrc),
                  ),
                  borderRadius: BorderRadius.circular(20)),
            ),
          ).p(8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    titleel,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: AppColors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                  ),
                  SizedBox(
                    width: 95,
                    height: 29.9,
                    child: CustomButton(
                        onTap: () {},
                        borderRadius: 20,
                        textColor: AppColors.white,
                        buttonText: "Upload"),
                  ).pOnly(left: 70),
                ],
              ).pSymmetric(h: 10, v: 10),
              Text(
                "Allowed JPG,GIF,PNG, Max size of 800kb",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(color: AppColors.greyText, fontSize: 11),
                ),
              ).pOnly(left: 70),
            ],
          ),
        ],
      ),
    ).make();
  }
}

Widget pInfo({
  image,
  title,
  subtitle,
  button,
}) {
  return Container(
      height: 90,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 85,
            width: 90,
            child: ProfileImgSelect(),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            textBaseline: TextBaseline.ideographic,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: AppColors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Text(
                  subtitle,
                  textAlign: TextAlign.start,
                  style: GoogleFonts.poppins(
                    textStyle:
                        TextStyle(color: AppColors.greyText, fontSize: 11),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SizedBox(
              width: 95,
              height: 30,
              child: button,
            ),
          ),
        ],
      ));
}
