// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, non_constant_identifier_names

import 'package:be_pass/app_Colors.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Center(
                    child: Text("Chat",
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
                        child: Text("Want to chat with professionals ?",
                            softWrap: true,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold)),
                      )),
                      Text(
                        "Chat, Get to know the professional",
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
