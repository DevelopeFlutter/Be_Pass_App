// ignore_for_file: prefer_const_constructors

import 'package:be_pass/Screens/profile_screen.dart';
import 'package:flutter/material.dart';

class BioScreen extends StatelessWidget {
  const BioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 232, 232, 232),
      body: Column(children: [
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
                    Text("Add Bio",
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
                          Text(
                            "Bio",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          TextFormField(
                            minLines: 2,
                            maxLines: 5,
                            textInputAction: TextInputAction.send,
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                              label: Text("Introduce Yourself"),
                              hintText:
                                  'Experienced web developer with a strong background in developing award-winning applications for a diverse clientele. 5+ years of industry',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ))))
      ]),
    );
  }
}
