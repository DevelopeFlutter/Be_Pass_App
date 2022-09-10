// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:be_pass/Authentication/View/login_view.dart';
import 'package:be_pass/Authentication/View/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Widgets/certificatesCard.dart';
import '../Widgets/profileCustomCard.dart';
import '../Widgets/trainerProfileCard.dart';
import '../app_Colors.dart';

class LandingPageView extends StatefulWidget {
  final bool userCheck;
  static const routeName = "landing-page";
  const LandingPageView(this.userCheck);

  @override
  State<LandingPageView> createState() => _LandingPageViewState();
}

class _LandingPageViewState extends State<LandingPageView> {
  List options = [
    "haha",
    "hoho",
    "heheh",
    "hoho",
    "heheh",
    "hoho",
    "heheh",
  ];
  Widget chipList(BuildContext context) {
    return Wrap(
        children: List<Widget>.generate(
      options.length,
      (int idx) {
        return ChoiceChip(
          label: Text(
            options[idx],
          ),
          selected: true,
          selectedColor: Color.fromARGB(255, 168, 230, 167),
          labelStyle: TextStyle(color: Colors.black),
        );
      },
    ).toList());
  }

  @override
  Widget build(BuildContext context) {
    if (widget.userCheck == true) {
      return Scaffold(
        backgroundColor: AppColors.backGround,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 0,
              ),
              Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: const ProfileCustomCard()),
              const SizedBox(
                height: 20,
              ),
              Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: TrainerProfileCard()),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: Text(
                    "Services",
                    style: GoogleFonts.poppins(
                        fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              SizedBox(
                height: 370,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Column(children: [
                          SizedBox(
                              height: 370,
                              width: 220,
                              child: Stack(
                                children: [
                                  const SizedBox(
                                      height: 160,
                                      child: Image(
                                          image: NetworkImage(
                                              "https://images.pexels.com/photos/841130/pexels-photo-841130.jpeg?cs=srgb&dl=pexels-victor-freitas-841130.jpg&fm=jpg"))),
                                  Positioned(
                                      bottom: 50,
                                      child: Container(
                                        height: 230,
                                        width: 220,
                                        decoration: BoxDecoration(
                                            color: AppColors.white,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Column(
                                            children: [
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  "TRX",
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                              ),
                                              RichText(
                                                  text: TextSpan(
                                                      text:
                                                          "Quis ipsum suspendisse ultrices gravida. Risu...",
                                                      style:
                                                          GoogleFonts.poppins(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: AppColors.black,
                                                      ),
                                                      children: <TextSpan>[
                                                    TextSpan(
                                                        text: "more",
                                                        style: GoogleFonts.poppins(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: AppColors
                                                                .gradientGreen))
                                                  ])),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 10, 0, 0),
                                                child: Container(
                                                    height: 110,
                                                    width: 200,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color:
                                                          AppColors.backGround,
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        customProfieWidget(
                                                          dataText: 'Group',
                                                          value: '10\$',
                                                        ),
                                                        customProfieWidget(
                                                          dataText: 'Personal',
                                                          value: '10\$',
                                                        ),
                                                        customProfieWidget(
                                                          dataText:
                                                              'Consulting',
                                                          value: '10\$',
                                                        ),
                                                      ],
                                                    )),
                                              )
                                            ],
                                          ),
                                        ),
                                      ))
                                ],
                              ))
                        ]),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 20),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Working Hour",
                    style: GoogleFonts.poppins(
                        fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              SizedBox(
                height: 100,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 20, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.ideographic,
                          children: [
                            Text(
                              "Sunday",
                              style: GoogleFonts.poppins(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                            RichText(
                                text: TextSpan(
                                    text: "8:00 AM",
                                    style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.black,
                                    ),
                                    children: <TextSpan>[
                                  TextSpan(
                                      text: "-",
                                      style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.black)),
                                  TextSpan(
                                      text: "5:00 PM",
                                      style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.black))
                                ])),
                          ],
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 20),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Working Areas",
                          style: GoogleFonts.poppins(
                              fontSize: 24, fontWeight: FontWeight.w700),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: chipList(context),
                        ),
                        Text("I work in north",
                            style: TextStyle(fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                ),
              ),
              CertificatedCared(),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Gallery",
                    style: GoogleFonts.poppins(
                        fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 220,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: Column(children: [
                          SizedBox(
                              height: 200,
                              width: 150,
                              child: Stack(
                                children: [
                                  const SizedBox(
                                      height: 140,
                                      child: Image(
                                          image: NetworkImage(
                                              "https://images.pexels.com/photos/1216589/pexels-photo-1216589.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"))),
                                  Positioned(
                                      bottom: 0,
                                      child: Container(
                                        height: 90,
                                        width: 150,
                                        decoration: BoxDecoration(
                                            color: AppColors.white,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Column(
                                            children: [
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  "Endurance",
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Text("17",
                                                      style:
                                                          GoogleFonts.poppins(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: AppColors.black,
                                                      )),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 6),
                                                    child: Text("photo",
                                                        style:
                                                            GoogleFonts.poppins(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: AppColors
                                                                    .black)),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ))
                                ],
                              ))
                        ]),
                      );
                    }),
              ),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
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
                      child: Text("Business Card",
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
                          child: Text("Business Owner?",
                              softWrap: true,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold)),
                        )),
                        Text(
                          "Create your personal business card",
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "Find out if he or she fits your needs",
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "Make an appointment and let's roll!",
                          textAlign: TextAlign.center,
                        ),
                        Center(
                            child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text("But for that, you need",
                              softWrap: true,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold)),
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
                            Colors.white, SignUpView.routeName,context),
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
                                  style:
                                      TextStyle(color: AppColors.gradientGreen))
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
}

Widget CustomListTile(
     text,  icon, Color Concolor, Color textColor, route, context) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).pushNamed(route);
    },
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
