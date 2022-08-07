// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:be_pass/Widgets/category_dropdown.dart';
import 'package:be_pass/Widgets/country_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //   backgroundColor: Color(0xff59DF56),
        body: Column(
          children: [
            VxArc(
              arcType: VxArcType.CONVEX,
              //height is used to give the edge value
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
                    "find Professinals",
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 100,
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
    );
  }
}
