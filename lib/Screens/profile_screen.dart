// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, non_constant_identifier_names, avoid_unnecessary_containers, prefer_const_constructors_in_immutables, unused_field, prefer_final_fields, sized_box_for_whitespace, use_key_in_widget_constructors

import 'package:be_pass/Screens/generl_profile_screen.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Widgets/custom_button_widget.dart';
import '../app_Colors.dart';

class Profile extends StatefulWidget {
  static const routeName = "user-profile";
  Profile();

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE1E1E3),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Headse(), Bio(), Gen(), Info()],
          ),
        ),
      ),
    );
  }
}

class Headse extends StatefulWidget {
  const Headse({Key? key}) : super(key: key);

  @override
  State<Headse> createState() => _HeadseState();
}

class _HeadseState extends State<Headse> {
  TextEditingController _uname = TextEditingController();
  TextEditingController _dob = TextEditingController();
  TextEditingController _loc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 140,
              child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 100,
                          child: Stack(
                            children: [
                              SizedBox(
                                height: 80,
                                width: 80,
                                child: Container(
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: CircleAvatar(
                                      backgroundColor: AppColors.gradientGreen,
                                      radius: 10.0,
                                      child: Icon(
                                        Icons.verified,
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
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Text("Company Logo",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                )),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("assets/logo.png"),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    );
                  }),
            ),
            Text("Selina Kayle. O",
                style: GoogleFonts.poppins(
                  textStyle:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
            //professional cat
            Row(
              children: [
                Icon(
                  FluentIcons.toolbox_12_filled,
                  color: AppColors.gradientGreen,
                ),
                SizedBox(
                  width: 10,
                ),
                Text("Personal Trainer",
                    style: GoogleFonts.poppins(
                      textStyle:
                          TextStyle(fontSize: 14, color: AppColors.greyText),
                    ))
              ],
            ),
            // phone

            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(
                  Icons.phone_callback,
                  color: AppColors.black,
                ),
                SizedBox(
                  width: 10,
                ),
                Text("+ 00 00000000",
                    style: GoogleFonts.poppins(
                      textStyle:
                          TextStyle(fontSize: 14, color: AppColors.black),
                    ))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            // email
            Row(
              children: [
                Icon(
                  Icons.email,
                  color: AppColors.black,
                ),
                SizedBox(
                  width: 10,
                ),
                Text("name@gmail.com",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 14,
                        color: AppColors.black,
                      ),
                    ))
              ],
            ),
            Divider(
              color: AppColors.greyText,
              thickness: 0.8,
            ),
            textformwidget(
                labeltext: "Date of Birth",
                controller: _uname,
                actionKeyboard: TextInputAction.next,
                onSubmitField: () {},
                textInputType: TextInputType.datetime,
                hintText: "13/2/1998"),

            textformwidget(
                labeltext: "Location",
                controller: _uname,
                actionKeyboard: TextInputAction.next,
                onSubmitField: () {},
                textInputType: TextInputType.streetAddress,
                hintText: "Barcelona, Spain"),

            textformwidget(
                labeltext: "Username",
                controller: _uname,
                actionKeyboard: TextInputAction.next,
                onSubmitField: () {},
                textInputType: TextInputType.datetime,
                hintText: "kylo.neee"),

            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  onTap: () {
                    Navigator.of(context).pushNamed(GenProfile.routeName);
                  },
                  buttonText: "Edit",
                  buttonColor: AppColors.white,
                  textColor: AppColors.gradientGreen,
                  borderRadius: 20,
                  borderColor: AppColors.gradientGreen,
                ),
                CustomButton(
                  onTap: () {},
                  buttonText: "Publish",
                  buttonColor: AppColors.gradientGreen,
                  textColor: AppColors.white,
                  borderRadius: 20,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class textformwidget extends StatelessWidget {
  final String labeltext;
  final TextEditingController controller;
  final TextInputAction actionKeyboard;
  final Function onSubmitField;
  final TextInputType textInputType;
  final String hintText;
  const textformwidget({
    Key? key,
    required this.labeltext,
    required this.controller,
    required this.actionKeyboard,
    required this.onSubmitField,
    required this.textInputType,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: actionKeyboard,
      keyboardType: textInputType,
      decoration: InputDecoration(hintText: hintText, label: Text(labeltext)),
    );
  }
}

class Bio extends StatefulWidget {
  const Bio({Key? key}) : super(key: key);

  @override
  State<Bio> createState() => _BioState();
}

class _BioState extends State<Bio> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Bio",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                minLines: 2,
                maxLines: 5,
                textInputAction: TextInputAction.send,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText:
                      'Experienced web developer with a strong background in developing award-winning applications for a diverse clientele. 5+ years of industry',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
                  width: 200,
                  child: CustomButton(
                    onTap: () {
                      Navigator.of(context).pushNamed(GenProfile.routeName);
                    },
                    buttonText: "Edit  Bio",
                    buttonColor: AppColors.gradientGreen,
                    textColor: AppColors.white,
                    borderRadius: 20,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Gen extends StatelessWidget {
  const Gen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "General",
                style: TextStyle(fontSize: 20),
              ),
              Divider(
                thickness: 0.8,
              ),
              Text(
                "About, Service, Certificate, Working hours, Gallery, Price ",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: AppColors.greyText, wordSpacing: 10, fontSize: 12),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Material(
                child: Center(
                  child: Container(
                    width: 200,
                    child: CustomButton(
                      onTap: () {
                        Navigator.of(context).pushNamed(GenProfile.routeName);
                      },
                      buttonText: "Add Information",
                      buttonColor: AppColors.gradientGreen,
                      textColor: AppColors.white,
                      borderRadius: 20,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Info extends StatelessWidget {
  const Info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Information",
                style: TextStyle(fontSize: 20),
              ),
              Divider(
                thickness: 0.8,
              ),
              Text(
                "About, Service, Certificate, Working hours, Gallery, Price ",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: AppColors.greyText, wordSpacing: 10, fontSize: 12),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Material(
                child: Center(
                  child: Container(
                    width: 200,
                    child: CustomButton(
                      onTap: () {
                        Navigator.of(context).pushNamed(GenProfile.routeName);
                      },
                      buttonText: "Add Information",
                      buttonColor: AppColors.gradientGreen,
                      textColor: AppColors.white,
                      borderRadius: 20,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyRoutes {
  static String GenInfo = "geninforoute";
}
