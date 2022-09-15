// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field, prefer_final_fields, constant_identifier_names

import 'package:be_pass/Services/language.dart';
import 'package:be_pass/utils/Loader.dart';
import 'package:be_pass/utils/showMessage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LanguageScreen extends StatefulWidget {
  static const routeName = "language-screen";
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String _user = 'EN';
  void submitLanguage()async {
    FocusScope.of(context).unfocus();
    try {
      PopupLoader.show();
      var lagnuageResponse = await language(_user);
      PopupLoader.hide();
      if (!lagnuageResponse["error"]) {
        ShowMessage().showMessage(context, "Successfully Language selected");
      } else {
        ShowMessage().showErrorMessage(context, "Some error");
      }
    } catch (e) {
      PopupLoader.hide();
      print(["SubmitLogin exception:", e.toString()]);
      ShowMessage().showErrorMessage(context, e.toString());
    }
  }
  dynamic languageChoice(value) {
    setState(() {
      _user = value;
      submitLanguage();
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 232, 232, 232),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 20,
        ),
        child: Column(
          children: [
            Column(
              children: [
                SizedBox(height: 20),
                Row(
                  children: [
                    IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          Navigator.of(context).pop();
                        }),
                    Text("Language",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Change the app language. We recommend resetting the app after changing the language",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text("English"),
                                  Radio(
                                    groupValue: _user,
                                    onChanged: languageChoice,
                                    value: 'EN',
                                  )
                                ],
                              ),
                              Divider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(" עברית "),
                                  Radio(
                                    groupValue: _user,
                                    onChanged: languageChoice,
                                    value: 'HE',
                                  )
                                ],
                              )
                            ],
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



