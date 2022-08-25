// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';

class CreditsScreen extends StatelessWidget {
  static const routeName = "credits";
  const CreditsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  Row(
                    children: [
                      IconButton(
                          icon: Icon(Icons.arrow_back_ios),
                          onPressed: () {
                            Navigator.of(context).pop();
                          }),
                      Text("Credits",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
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
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Center(
                            child: Text(
                          "Thank you for all the creative people all the websites for the icons, images and assets:",
                          softWrap: true,
                        )),
                        SizedBox(height: 30),
                        Row(
                          children: [
                            Text("Thanks"),
                            TextButton(
                                onPressed: () {},
                                child: Text("Freepik",
                                    style: TextStyle(
                                        decoration: TextDecoration.underline)))
                          ],
                        ),
                        Row(
                          children: [
                            Text("Thanks"),
                            TextButton(
                                onPressed: () {},
                                child: Text("Flaticon",
                                    style: TextStyle(
                                        decoration: TextDecoration.underline)))
                          ],
                        ),
                        Row(
                          children: [
                            Text("Thanks"),
                            TextButton(
                                onPressed: () {},
                                child: Text("Onlinewebfonts",
                                    style: TextStyle(
                                        decoration: TextDecoration.underline)))
                          ],
                        )
                      ],
                    ),
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
