
import 'dart:convert';

import 'package:be_pass/Authentication/View/login_view.dart';
import 'package:be_pass/Network/APIs_call.dart';
import 'package:be_pass/Network/APIs_manger.dart';
import 'package:be_pass/Screens/home_screen.dart';
import 'package:be_pass/Widgets/bottom_nav.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future signUp(
    String username, String email, String password)async{
  var _contnet;
  bool _error = false;
  String _errorMessage = "Unable to process, please try later";

  try{
    var data = jsonEncode({"username":username, "email":email, "password":password});

    print(" data is to be sent,$data");
    var response = await API().post(api_manger.SIGNUP, data);
    print("Status Code =${response.statusCode}");
    if(response.statusCode == 200){
      _error = false;
      _contnet = jsonDecode(response.body);
      print(_contnet);
      print(_contnet['registrationCode']);
      final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setString('registrationCode',_contnet['registrationCode']);
      print('move next screen ..........');
      Get.to(BottomBar());
    }else{
      _error = true;
      _contnet = jsonDecode(response.body)["error"];
    }
  }catch(e){
    _error = true;
    _contnet = _errorMessage;
  }
  return {
    "error":_error,
    "_contnet":_contnet,
  };
}