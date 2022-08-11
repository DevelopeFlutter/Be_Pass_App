// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Widgets/certificatesCard.dart';
import '../Widgets/profileCustomCard.dart';
import '../Widgets/trainerProfileCard.dart';
import '../app_Colors.dart';

class LandingPageView extends StatefulWidget {
  static const routeName = "landing-page";
  const LandingPageView({Key? key}) : super(key: key);

  @override
  State<LandingPageView> createState() => _LandingPageViewState();
}

class _LandingPageViewState extends State<LandingPageView> {
  @override
  Widget build(BuildContext context) {
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
                child: const TrainerProfileCard()),
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
                                        image: AssetImage(
                                            "assets/muscular-man.png"))),
                                Positioned(
                                    bottom: 50,
                                    child: Container(
                                      height: 210,
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
                                                    style: GoogleFonts.poppins(
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
                                                  height: 100,
                                                  width: 200,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: AppColors.backGround,
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
                                                        dataText: 'Consulting',
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
              height: 200,
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
                                        image: AssetImage(
                                            "assets/motivated-active.png"))),
                                Positioned(
                                    bottom: 0,
                                    child: Container(
                                      height: 80,
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
                                                    style: GoogleFonts.poppins(
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
  }
}
