// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, non_constant_identifier_names, avoid_unnecessary_containers, prefer_const_constructors_in_immutables, unused_field, prefer_final_fields, sized_box_for_whitespace, use_key_in_widget_constructors, camel_case_types, unnecessary_null_comparison

import 'package:be_pass/Authentication/View/login_view.dart';
import 'package:be_pass/Authentication/View/sign_up_view.dart';
import 'package:be_pass/ForgetPasswordView/verifiyEmail.dart';
import 'package:be_pass/Screens/bio_screen.dart';
import 'package:be_pass/Screens/certificates_screen.dart';
import 'package:be_pass/Screens/gallery_view.dart';
import 'package:be_pass/Screens/general_profile_screen.dart';
import 'package:be_pass/Screens/services.dart';
import 'package:be_pass/Screens/social_screen.dart';
import 'package:be_pass/Screens/working_areas.dart';
import 'package:be_pass/Screens/working_hours.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Widgets/custom_button_widget.dart';
import '../app_Colors.dart';
import 'landingPageView.dart';

class Profile extends StatefulWidget {
  static const routeName = "user-profile";
  final bool userCheck;
  final bool bioCheck = true;
  final bool serviceCheck = true;
  final bool whCheck = true;
  final bool waCheck = true;
  final bool certificateCheck = true;
  final bool galleryCheck = true;
  final bool socialMediaCheck = true;
  Profile(this.userCheck);

  @override
  State<Profile> createState() => _ProfileState();
  List serviceList = ["a", "a", "a", "a", "a"];
}

class _ProfileState extends State<Profile> {
  bool seeMore = false;
  bool facebook = true;
  bool insta = true;
  bool tiktok = true;
  bool linkedin = false;
  bool quora = false;
  bool twitter = false;
  @override
  Widget build(BuildContext context) {
    List<Map> workingHours = [
      {"start": "7:00", "end": "8:00"}
    ];
    List<Map> certificateList = [
      {"name": "Personal Train", "exp": 4},
      {"name": "Gardener", "exp": 2}
    ];
    List<Map> galleryList = [
      {"name": "Endurance", "photos": 4},
      {"name": "Nutritionist", "photos": 2}
    ];
    return widget.userCheck
        ? Scaffold(
            backgroundColor: Color(0xffE1E1E3),
            body: SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Headse(),
                    Bio(
                        bioCheck: widget.bioCheck,
                        bioText:
                            "Here you can introduce yourself better write couple of words"),
                    widget.serviceCheck
                        ? serviceData()
                        : ProfileCard(
                            "Services",
                            "Describe your services, explain everything you are doing and set the prices",
                            ServicesScreen.routeName),
                    widget.whCheck
                        ? workingHoursData(workingHours)
                        : ProfileCard(
                            "Working Hours",
                            "Set your working hours for each day and let the clients know when you are available",
                            WorkingHours.routeName),
                    widget.waCheck
                        ? workingAreasData()
                        : ProfileCard(
                            "Working Areas",
                            "Let the clients know in what places are you working",
                            WorkingAreas.routeName),
                    widget.certificateCheck
                        ? certificateData(certificateList)
                        : ProfileCard(
                            "Certificates",
                            "List your certifications, degrees, courses and everything you got to show that you are qualified",
                            CertificatesScreen.routeName),
                    widget.galleryCheck
                        ? galleryData(galleryList, certificateList)
                        : ProfileCard(
                            "Gallery",
                            "Upload all the images that you have for each service, to impress everyone",
                            GalleryScreenView.routeName),
                    widget.galleryCheck
                        ? socialMediaData()
                        : ProfileCard(
                            "Social Media",
                            "Add all the links to your social media",
                            SocialScreen.routeName),
                    SizedBox(height: 10)
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
                                Colors.white,
                                SignUpView.routeName,
                                context),
                            SizedBox(height: 10),
                            GestureDetector(
                              onTap: () {
                                Get.to(LoginView());
                              },
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

  Card socialMediaData() {
    return Card(
        child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Social Media",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(SocialScreen.routeName);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.edit, color: AppColors.gradientGreen),
                        Text("Edit",
                            style: TextStyle(color: AppColors.gradientGreen))
                      ],
                    ),
                  ),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.facebook,
                      color: facebook ? AppColors.gradientGreen : Colors.grey),
                  SvgPicture.asset("assets/insta-icon.svg",
                      color: insta ? AppColors.gradientGreen : Colors.grey),
                  Icon(Icons.tiktok,
                      color: tiktok ? AppColors.gradientGreen : Colors.grey),
                  SvgPicture.asset("assets/linkedIn-icon.svg",
                      color: linkedin ? AppColors.gradientGreen : Colors.grey),
                  Icon(Icons.quora,
                      color: quora ? AppColors.gradientGreen : Colors.grey),
                  SvgPicture.asset("assets/twitter-icon.svg",
                      color: twitter ? AppColors.gradientGreen : Colors.grey),
                ],
              )
            ])));
  }

  Card galleryData(List<Map<dynamic, dynamic>> galleryList,
      List<Map<dynamic, dynamic>> certificateList) {
    return Card(
        child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Gallery",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(GalleryScreenView.routeName);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.edit, color: AppColors.gradientGreen),
                        Text("Edit",
                            style: TextStyle(color: AppColors.gradientGreen))
                      ],
                    ),
                  ),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Name",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text("Photos", style: TextStyle(color: Colors.grey))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  height: galleryList.length >= 2 ? 110 : 150,
                  child: ListView.builder(
                      itemBuilder: (context, index) => Column(
                            children: [
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(galleryList[index]["name"]),
                                    Text(galleryList[index]["photos"]
                                        .toString()),
                                  ]),
                              Divider(),
                            ],
                          ),
                      itemCount: certificateList.length)),
            ])));
  }

  Card certificateData(List<Map<dynamic, dynamic>> certificateList) {
    return Card(
        child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Certificates",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(CertificatesScreen.routeName);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.edit, color: AppColors.gradientGreen),
                        Text("Edit",
                            style: TextStyle(color: AppColors.gradientGreen))
                      ],
                    ),
                  ),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Name",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text("Exp(Years)", style: TextStyle(color: Colors.grey))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  height: certificateList.length >= 2 ? 110 : 150,
                  child: ListView.builder(
                      itemBuilder: (context, index) => Column(
                            children: [
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(certificateList[index]["name"]),
                                    Text(certificateList[index]["exp"]
                                        .toString()),
                                  ]),
                              Divider(),
                            ],
                          ),
                      itemCount: certificateList.length)),
            ])));
  }

  Card workingAreasData() {
    return Card(
        child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Working Areas",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(WorkingAreas.routeName);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.edit, color: AppColors.gradientGreen),
                        Text("Edit",
                            style: TextStyle(color: AppColors.gradientGreen))
                      ],
                    ),
                  ),
                ],
              ),
              Divider(),
              Text(
                  "This is supposed to be the working areas mentioned by the user. I don't know it seems like it should also have some chips but nevermind",
                  style: TextStyle(color: Colors.grey))
            ])));
  }

  Card workingHoursData(List<Map<dynamic, dynamic>> workingHours) {
    return Card(
        child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Working Hours",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(WorkingHours.routeName);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.edit, color: AppColors.gradientGreen),
                        Text("Edit",
                            style: TextStyle(color: AppColors.gradientGreen))
                      ],
                    ),
                  ),
                ],
              ),
              Divider(indent: 20, endIndent: 20),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text("Monday", style: TextStyle(fontWeight: FontWeight.bold)),
                Text(workingHours[0]["start"] + "-" + workingHours[0]["end"],
                    style: TextStyle(color: Colors.grey))
              ]),
              Divider(),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text("Tuesday", style: TextStyle(fontWeight: FontWeight.bold)),
                Text(workingHours[0]["start"] + "-" + workingHours[0]["end"],
                    style: TextStyle(color: Colors.grey))
              ]),
              Divider(),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text("Wednesday",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(workingHours[0]["start"] + "-" + workingHours[0]["end"],
                    style: TextStyle(color: Colors.grey))
              ]),
              Divider(),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text("Thursday", style: TextStyle(fontWeight: FontWeight.bold)),
                Text(workingHours[0]["start"] + "-" + workingHours[0]["end"],
                    style: TextStyle(color: Colors.grey))
              ]),
              Divider(),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text("Friday", style: TextStyle(fontWeight: FontWeight.bold)),
                Text(workingHours[0]["start"] + "-" + workingHours[0]["end"],
                    style: TextStyle(color: Colors.grey))
              ]),
              Divider(),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text("Saturday", style: TextStyle(fontWeight: FontWeight.bold)),
                Text(workingHours[0]["start"] + "-" + workingHours[0]["end"],
                    style: TextStyle(color: Colors.grey))
              ]),
              Divider(),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text("Sunday", style: TextStyle(fontWeight: FontWeight.bold)),
                Text(workingHours[0]["start"] + "-" + workingHours[0]["end"],
                    style: TextStyle(color: Colors.grey))
              ]),
              Divider(),
            ])));
  }

  Card serviceData() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Service",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(ServicesScreen.routeName);
                  },
                  child: Row(
                    children: [
                      Icon(Icons.edit, color: AppColors.gradientGreen),
                      Text("Edit",
                          style: TextStyle(color: AppColors.gradientGreen))
                    ],
                  ),
                ),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Type", style: TextStyle(color: Colors.grey)),
                Text("Price(avg.)", style: TextStyle(color: Colors.grey))
              ],
            ),
            SizedBox(height: 10),
            Container(
              height: seeMore ? 300 : 150,
              child: ListView.builder(
                itemBuilder: ((context, index) => serviceWidget()),
                itemCount: seeMore ? widget.serviceList.length : 1,
              ),
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    seeMore = !seeMore;
                  });
                },
                child: Text(seeMore ? "See Less" : "See More",
                    style: TextStyle(color: AppColors.gradientGreen)))
          ],
        ),
      ),
    );
  }

  Column serviceWidget() {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Service #", style: TextStyle(color: Colors.grey)),
          Text("Prices", style: TextStyle(color: Colors.grey))
        ],
      ),
      Container(
          height: 80,
          child: ListView.builder(
            itemBuilder: (context, index) => Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("Personal Training"), Text("10\$")],
                ),
                SizedBox(height: 5)
              ],
            ),
            itemCount: 3,
          )),
      Divider(),
      SizedBox(height: 20),
    ]);
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
                                height: 100,
                                width: 100,
                                child: Container(
                                    height: 150,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 214, 214, 214),
                                      borderRadius: BorderRadius.circular(55),
                                    ),
                                    child: SvgPicture.asset(
                                      "assets/user.svg",
                                    )),
                              ),
                              Icon(
                                Icons.stars,
                                color: AppColors.gradientGreen,
                              )
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
                              child: SvgPicture.asset(
                                "assets/splash-img.svg",
                                color: AppColors.gradientGreen,
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
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(VerifyEmailView.routeName);
              },
              child: Text("Confirm Your Email",
                  style: TextStyle(
                      color: Color.fromRGBO(89, 223, 86, 1),
                      fontSize: 15,
                      decoration: TextDecoration.underline)),
            ),
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
  final bool bioCheck;
  final String bioText;
  const Bio({Key? key, required this.bioCheck, required this.bioText})
      : super(key: key);

  @override
  State<Bio> createState() => _BioState();
}

class _BioState extends State<Bio> {
  @override
  Widget build(BuildContext context) {
    return widget.bioCheck == true
        ? Card(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(BioScreen.routeName);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Bio",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(BioScreen.routeName);
                            },
                            child: Row(
                              children: [
                                Icon(Icons.edit,
                                    color: AppColors.gradientGreen),
                                Text("Edit",
                                    style: TextStyle(
                                        color: AppColors.gradientGreen))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                        height: 120,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(widget.bioText),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          )
        : Card(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Bio",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                        height: 120,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              "Here you can introduce yourself better Write couple of words",
                              style: TextStyle(color: Colors.grey)),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Container(
                        width: 200,
                        child: CustomButton(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(BioScreen.routeName);
                          },
                          buttonText: "Add Info",
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
                color: Colors.white,
                child: Center(
                  child: Container(
                    color: Colors.white,
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
