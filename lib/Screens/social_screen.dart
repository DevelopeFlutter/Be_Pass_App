// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:be_pass/Screens/profile_screen.dart';
import 'package:be_pass/Widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';

class SocialScreen extends StatelessWidget {
  static const routeName = "social-screen";
  const SocialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _fbLink = TextEditingController();
    TextEditingController _instaLink = TextEditingController();
    TextEditingController _ttLink = TextEditingController();
    TextEditingController _liLink = TextEditingController();
    TextEditingController _twLink = TextEditingController();
    TextEditingController _quLink = TextEditingController();
    return Scaffold(
      backgroundColor: Color.fromRGBO(232, 232, 232, 1),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                SizedBox(height: 20),
                Center(
                  child: Row(
                    children: [
                      IconButton(
                          icon: Icon(Icons.arrow_back_ios),
                          onPressed: () {
                            Navigator.of(context).pop();
                          }),
                      Text("Add Social Media",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Center(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Card(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(Icons.link),
                                Text(" Social Media Links",
                                    style: TextStyle(fontSize: 18)),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            textformwidget(
                                labeltext: "Facebook",
                                controller: _fbLink,
                                actionKeyboard: TextInputAction.next,
                                onSubmitField: () {},
                                textInputType: TextInputType.text,
                                hintText: "Add Link"),
                            SizedBox(
                              height: 20,
                            ),
                            textformwidget(
                                labeltext: "Instagram",
                                controller: _instaLink,
                                actionKeyboard: TextInputAction.next,
                                onSubmitField: () {},
                                textInputType: TextInputType.text,
                                hintText: "Add Link"),
                            SizedBox(
                              height: 20,
                            ),
                            textformwidget(
                                labeltext: "Tik Tok",
                                controller: _ttLink,
                                actionKeyboard: TextInputAction.next,
                                onSubmitField: () {},
                                textInputType: TextInputType.text,
                                hintText: "Add Link"),
                            SizedBox(
                              height: 20,
                            ),
                            textformwidget(
                                labeltext: "Linked In",
                                controller: _liLink,
                                actionKeyboard: TextInputAction.next,
                                onSubmitField: () {},
                                textInputType: TextInputType.text,
                                hintText: "Add Link"),
                            SizedBox(
                              height: 20,
                            ),
                            textformwidget(
                                labeltext: "Twitter",
                                controller: _ttLink,
                                actionKeyboard: TextInputAction.next,
                                onSubmitField: () {},
                                textInputType: TextInputType.text,
                                hintText: "Add Link"),
                            SizedBox(
                              height: 20,
                            ),
                            textformwidget(
                                labeltext: "Quora",
                                controller: _quLink,
                                actionKeyboard: TextInputAction.done,
                                onSubmitField: () {},
                                textInputType: TextInputType.text,
                                hintText: "Add Link")
                          ],
                        ),
                      )))),
          SizedBox(
            height: 20,
          ),
          CustomButton(
            onTap: () {},
            buttonText: "Save Changes",
            textColor: Colors.white,
            borderRadius: 25,
            borderColor: Color.fromARGB(255, 232, 232, 232),
          )
        ]),
      ),
    );
  }
}
