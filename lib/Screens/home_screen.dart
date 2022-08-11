// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:be_pass/Widgets/category_dropdown.dart';
import 'package:be_pass/Widgets/country_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../app_Colors.dart';

class HomeScreen extends StatelessWidget {
  final bool userCheck;
  HomeScreen(this.userCheck);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (userCheck == true) {
      return SafeArea(
        child: Scaffold(
          //   backgroundColor: Color(0xff59DF56),
          body: SingleChildScrollView(
            child: Column(
              children: [
                VxArc(
                  arcType: VxArcType.CONVEX,
                  height: 50,
                  edge: VxEdge.BOTTOM,
                  child: Container(
                    height: 400,
                    width: double.infinity,
                    color: Color(0xff59DF56),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 20, top: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 20,
                                child: CircleAvatar(
                                  radius: 18,
                                  foregroundColor: Colors.white,
                                  backgroundColor: Color(0xff59DF56),
                                  child: Text("en"),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 70,
                        ),
                        Text(
                          "Work Simply ",
                          style: TextStyle(color: Colors.white, fontSize: 36),
                        ),
                        Text(
                          "Thanks to Be-Pass ",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Catbut(),
                        SizedBox(
                          height: 20,
                        ),
                        Countbut(),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Card(
                  elevation: 6.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                    height: 50,
                    width: 312,
                    decoration: BoxDecoration(
                        color: Color(0xff59DF56),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        "Find Professinals",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height / 10,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Create an account",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff59DF56),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: RichText(
                    text: TextSpan(
                        text: 'Already have an account?',
                        style: TextStyle(color: Colors.black, fontSize: 14),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' Log in',
                            style: TextStyle(
                                color: Color(0xff59DF56),
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline),
                          )
                        ]),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    } else {
      return Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Center(
                child: Text("Business Card",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
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
                          Colors.white),
                      SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {},
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
      );
    }
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
