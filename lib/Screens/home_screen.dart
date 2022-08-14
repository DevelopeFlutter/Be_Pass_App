// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, unused_import

import 'package:be_pass/Widgets/category_dropdown.dart';
import 'package:be_pass/Widgets/country_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Widgets/bottom_nav.dart';

class HomeScreen extends StatelessWidget {
  final bool userCheck;
  HomeScreen(this.userCheck);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return userCheck
        ? SafeArea(
            child: Scaffold(
              //bottomNavigationBar: BottomBar(),
              backgroundColor: Color.fromARGB(255, 232, 232, 232),
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
                        color: Color.fromRGBO(89, 223, 86, 1),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 20, top: 30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 20,
                                    child: CircleAvatar(
                                      radius: 18,
                                      foregroundColor: Colors.white,
                                      backgroundColor:
                                          Color.fromRGBO(89, 223, 86, 1),
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
                              "Find Professionals",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "That Be-Pass tailors especially for you",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
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
                  ],
                ),
              ),
            ),
          )
        : SafeArea(
            child: Scaffold(
              //bottomNavigationBar: BottomBar(),
              backgroundColor: Color.fromARGB(255, 232, 232, 232),
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
                        color: Color.fromRGBO(89, 223, 86, 1),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 20, top: 30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 20,
                                    child: CircleAvatar(
                                      radius: 18,
                                      foregroundColor: Colors.white,
                                      backgroundColor:
                                          Color.fromRGBO(89, 223, 86, 1),
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
                              "Find Professionals",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "That Be-Pass tailors especially for you",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
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
                            color: Color.fromRGBO(89, 223, 86, 1),
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
                          color: Color.fromRGBO(89, 223, 86, 1),
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
                                    color: Color.fromRGBO(89, 223, 86, 1),
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
  }
}
