// ignore_for_file: prefer_const_constructors, prefer_final_fields, must_be_immutable, unused_field, sort_child_properties_last, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';
import '../Widgets/custom_button_widget.dart';
import '../Widgets/text_widget.dart';
import '../app_Colors.dart';

class GenProfile extends StatelessWidget {
  static const routeName = "gen-profile";
  TextEditingController _fname = TextEditingController();
  TextEditingController _lname = TextEditingController();
  TextEditingController _dob = TextEditingController();
  TextEditingController _loc = TextEditingController();

  GenProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "About",
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
                color: AppColors.black, wordSpacing: 10, fontSize: 22),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 150,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (BuildContext context, int index) {
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
                                  image: AssetImage("assets/man.jpg"),
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
                                  "Main Image",
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
                                textStyle: TextStyle(
                                    color: AppColors.greyText, fontSize: 11),
                              ),
                            ).pOnly(left: 70),
                            Divider(
                              thickness: 2,
                              color: Colors.black,
                            )
                          ],
                        ),
                      ],
                    ),
                  ).make();
                },
              ),
            ),
            Mytextwidget(
                labeltext: "First name",
                controller: _fname,
                actionKeyboard: TextInputAction.next,
                onSubmitField: () {},
                textInputType: TextInputType.name,
                hintText: "first name"),
            Mytextwidget(
                labeltext: "last name",
                controller: _lname,
                actionKeyboard: TextInputAction.next,
                onSubmitField: () {},
                textInputType: TextInputType.name,
                hintText: "last name"),
            profsel(),
            Mytextwidget(
                labeltext: "Date of Birth",
                controller: _fname,
                actionKeyboard: TextInputAction.next,
                onSubmitField: () {},
                textInputType: TextInputType.datetime,
                hintText: "19/2/2000"),
            Mytextwidget(
                labeltext: "Your Location",
                controller: _fname,
                actionKeyboard: TextInputAction.done,
                onSubmitField: () {},
                textInputType: TextInputType.streetAddress,
                hintText: "City, town"),
            SizedBox(
              height: 100,
            ),
            Container(
              height: 50,
              width: 150,
              child: CustomButton(
                  textColor: AppColors.white,
                  borderRadius: 20,
                  onTap: () {},
                  buttonText: "Save Changes"),
            )
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
