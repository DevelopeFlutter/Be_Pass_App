// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field, prefer_final_fields, constant_identifier_names

import 'package:be_pass/Services/time&currency.dart';
import 'package:be_pass/utils/Loader.dart';
import 'package:be_pass/utils/showMessage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../app_Colors.dart';


class CurrencyTimeScreen extends StatefulWidget {
  static const routeName = "language-and-time-format";
  const CurrencyTimeScreen({Key? key}) : super(key: key);

  @override
  State<CurrencyTimeScreen> createState() => _CurrencyTimeScreenState();
}

class _CurrencyTimeScreenState extends State<CurrencyTimeScreen> {
  String time = "01:00";

   bool _toggleState = false;

  void _attemptChange(bool newState) {
    setState(() {
      _toggleState = !_toggleState;
      print('togle state value$_toggleState');
      timeFormatChange();
      if (_toggleState == false) {
        time = "1:00 PM";
      } else {
        time = "13:00";
      }
    });
  }

   String _user = 'USD';

  void currencyChoice(value) {
    setState(() {
      _user = value;
      currencyS();
    });
  }
  void timeFormatChange()async{
    try{
      PopupLoader.show();
      var timeFormatResponse = await changeTimeFormat(_toggleState);

       _toggleState = timeFormatResponse['_contnet']['timeFormat24'];
       print(_toggleState);
      PopupLoader.hide();
      if (!timeFormatResponse['error']) {
        ShowMessage().showMessage(context, "Time Format changed to $time");
      } else {
        ShowMessage().showErrorMessage(context, "Some error");
      }
    }catch(e){
      PopupLoader.hide();
      print(["SubmitLogin exception:", e.toString()]);
      ShowMessage().showErrorMessage(context, e.toString());
    }
  }

  void currencyS()async{
    try{
      PopupLoader.show();
      var currencyResponse = await changeCurrency(_user);
      print(currencyResponse);
      PopupLoader.hide();
      if (!currencyResponse['error']) {
        ShowMessage().showMessage(context, "Currency changed to $_user");
      } else {
        ShowMessage().showErrorMessage(context, "Some error");
      }
    }catch(e){
      PopupLoader.hide();
      print(["SubmitLogin exception:", e.toString()]);
      ShowMessage().showErrorMessage(context, e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 232, 232, 232),
      body: Column(
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
                    Text("Currency & Time Formats",
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
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text("Time Format",
                    style: TextStyle(color: AppColors.gradientGreen)),
              )),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Card(
                color: Colors.white,
                child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text("Use 24 hours format"),
                            Text(
                              time.toString(),
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                        Switch(
                          onChanged: _attemptChange,
                          value: _toggleState,
                        )
                      ],
                    )),
              ),
            ),
          ),
          SizedBox(height: 30),
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text("Currency",
                    style: TextStyle(color: AppColors.gradientGreen)),
              )),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Card(
                  color: Colors.white,
                  child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          currencyRow(
                              "₪", "ILS", "Israeli Shekel", "ILS"),
                          Divider(),
                          currencyRow("\$", "USD", "United States Dollar",
                              "USD"),
                          Divider(),
                          currencyRow("€", "EUR", "Euro", "EUR"),
                          Divider(),
                          currencyRow(
                              "£", "GBP", "British Pound", "GBP"),
                        ],
                      ))))
        ],
      ),
    );
  }

  Row currencyRow(String icon, String title, String name,  value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              icon,
              style: TextStyle(fontSize: 25),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(title,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(name,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ))
              ],
            ),
          ],
        ),
        Radio(value: value, groupValue: _user, onChanged: currencyChoice)
      ],
    );
  }
}
