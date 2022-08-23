// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, non_constant_identifier_names, avoid_unnecessary_containers, prefer_const_constructors_in_immutables, unused_field, prefer_final_fields, sized_box_for_whitespace, use_key_in_widget_constructors, camel_case_types, unnecessary_null_comparison

import 'package:be_pass/Screens/bio_screen.dart';
import 'package:be_pass/Screens/certificates_screen.dart';
import 'package:be_pass/Screens/generl_profile_screen.dart';
import 'package:be_pass/Screens/services.dart';
import 'package:be_pass/Screens/social_screen.dart';
import 'package:be_pass/Screens/working_areas.dart';
import 'package:be_pass/Screens/working_hours.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Widgets/custom_button_widget.dart';
import '../app_Colors.dart';

class Profile extends StatefulWidget {
  static const routeName = "user-profile";
  final bool userCheck;
  Profile(this.userCheck);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return widget.userCheck
        ? Scaffold(
            backgroundColor: Color(0xffE1E1E3),
            body: SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Headse(),
                    Bio(),
                    ProfileCard(
                        "Services",
                        "Describe your services, explain everything you are doing and set the prices",
                        ServicesScreen.routeName),
                    ProfileCard("General", "Lorem Ipsum Lorem IpsumLorem Ipsum",
                        GenProfile.routeName),
                    ProfileCard("Information",
                        "Lorem Ipsum Lorem IpsumLorem Ipsum", "null"),
                    ProfileCard("Social", "Lorem Ipsum Lorem IpsumLorem Ipsum",
                        SocialScreen.routeName),
                    ProfileCard(
                        "About", "Lorem Ipsum Lorem IpsumLorem Ipsum", "null"),
                    ProfileCard(
                        "Working Hours",
                        "Lorem Ipsum Lorem IpsumLorem Ipsum",
                        WorkingHours.routeName),
                    ProfileCard(
                        "Working Areas",
                        "Lorem Ipsum Lorem IpsumLorem Ipsum",
                        WorkingAreas.routeName),
                    ProfileCard(
                        "Certificates",
                        "Lorem Ipsum Lorem IpsumLorem Ipsum",
                        CertificatesScreen.routeName),
                    ProfileCard("Gallery", "Lorem Ipsum Lorem IpsumLorem Ipsum",
                        "null"),
                    ProfileCard(
                        "Price", "Lorem Ipsum Lorem IpsumLorem Ipsum", "null"),
                  ],
                ),
              ),
            ),
          )
        : Scaffold(
            backgroundColor: Color.fromARGB(255, 232, 232, 232),
            body: Center(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Center(
                          child: Text("Profile",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Card(
                        color: Colors.white,
                        child: Column(
                          children: [
                            Center(
                                child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text("Build your business card",
                                  softWrap: true,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold)),
                            )),
                            Text(
                              "It's easy",
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "All you have to do is fill in the blanks",
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "And let clients choose you!",
                              textAlign: TextAlign.center,
                            ),
                            Center(
                                child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text("But for that, you need",
                                  softWrap: true,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold)),
                            )),
                            Icon(
                              Icons.arrow_downward_rounded,
                              color: AppColors.gradientGreen,
                              size: 45,
                            ),
                            CustomListTile(
                                "Create an account",
                                Icons.person_add_alt_outlined,
                                AppColors.gradientGreen,
                                Colors.white),
                            SizedBox(height: 10),
                            GestureDetector(
                              onTap: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Already have an account? "),
                                  Text("Log in",
                                      style: TextStyle(
                                          color: AppColors.gradientGreen))
                                ],
                              ),
                            ),
                            SizedBox(height: 30)
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}

GestureDetector CustomListTile(
    String text, IconData icon, Color Concolor, Color textColor) {
  return GestureDetector(
    onTap: () {},
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        decoration: BoxDecoration(
            color: Concolor, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(icon, color: textColor),
            SizedBox(width: 10),
            Text(text, style: TextStyle(color: textColor)),
          ]),
        ),
      ),
    ),
  );
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
            SizedBox(height: 5),
            Text("Confirm Your Email",
                style: TextStyle(
                    color: Color.fromRGBO(89, 223, 86, 1),
                    fontSize: 15,
                    decoration: TextDecoration.underline)),
            Divider(
              color: AppColors.greyText,
              thickness: 0.8,
            ),
            Text("Date of Birth", style: TextStyle()),
            Text("20-02-1998",
                style: TextStyle(fontSize: 19, color: Colors.grey)),
            Divider(
              color: AppColors.greyText,
              thickness: 0.8,
            ),
            Text("Location", style: TextStyle()),
            Text("Barcelona, Spain",
                style: TextStyle(fontSize: 19, color: Colors.grey)),
            Divider(
              color: AppColors.greyText,
              thickness: 0.8,
            ),
            Text("User Name", style: TextStyle()),
            Text("kylo.seeelina",
                style: TextStyle(fontSize: 19, color: Colors.grey)),
            Divider(
              color: AppColors.greyText,
              thickness: 0.8,
            ),
            // textformwidget(
            //     labeltext: "Date of Birth",
            //     controller: _uname,
            //     actionKeyboard: TextInputAction.next,
            //     onSubmitField: () {},
            //     textInputType: TextInputType.datetime,
            //     hintText: "13/2/1998"),

            // textformwidget(
            //     labeltext: "Location",
            //     controller: _uname,
            //     actionKeyboard: TextInputAction.next,
            //     onSubmitField: () {},
            //     textInputType: TextInputType.streetAddress,
            //     hintText: "Barcelona, Spain"),

            // textformwidget(
            //     labeltext: "Username",
            //     controller: _uname,
            //     actionKeyboard: TextInputAction.next,
            //     onSubmitField: () {},
            //     textInputType: TextInputType.datetime,
            //     hintText: "kylo.neee"),

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
                      Navigator.of(context).pushNamed(BioScreen.routeName);
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

// class Gen extends StatelessWidget {
//   const Gen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.all(15.0),
//         child: Container(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "General",
//                 style: TextStyle(fontSize: 20),
//               ),
//               Divider(
//                 thickness: 0.8,
//               ),
//               Text(
//                 "About, Service, Certificate, Working hours, Gallery, Price ",
//                 style: GoogleFonts.poppins(
//                   textStyle: TextStyle(
//                       color: AppColors.greyText, wordSpacing: 10, fontSize: 12),
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Material(
//                 child: Center(
//                   child: Container(
//                     width: 200,
//                     child: CustomButton(
//                       onTap: () {},
//                       buttonText: "Add Information",
//                       buttonColor: AppColors.gradientGreen,
//                       textColor: AppColors.white,
//                       borderRadius: 20,
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class Info extends StatelessWidget {
//   const Info({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.all(15.0),
//         child: Container(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "Information",
//                 style: TextStyle(fontSize: 20),
//               ),
//               Divider(
//                 thickness: 0.8,
//               ),
//               Text(
//                 "About, Service, Certificate, Working hours, Gallery, Price ",
//                 style: GoogleFonts.poppins(
//                   textStyle: TextStyle(
//                       color: AppColors.greyText, wordSpacing: 10, fontSize: 12),
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Material(
//                 child: Center(
//                   child: Container(
//                     width: 200,
//                     child: CustomButton(
//                       onTap: () {
//                         Navigator.of(context).pushNamed(GenProfile.routeName);
//                       },
//                       buttonText: "Add Information",
//                       buttonColor: AppColors.gradientGreen,
//                       textColor: AppColors.white,
//                       borderRadius: 20,
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class ProfileCard extends StatelessWidget {
  final String title;
  final String description;
  final String route;
  const ProfileCard(this.title, this.description, this.route);

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
                title,
                style: TextStyle(fontSize: 20),
              ),
              Divider(
                thickness: 0.8,
              ),
              Text(
                description,
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
                        if (route != "null") {
                          Navigator.of(context).pushNamed(route);
                        }
                      },
                      buttonText: "Add Info",
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
