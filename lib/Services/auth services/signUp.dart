import 'dart:convert';

import 'package:be_pass/Network/APIs_call.dart';
import 'package:be_pass/Network/APIs_manger.dart';
import 'package:get/get.dart';

Future signUp(
String username, String email, String password)async{
  var _contnet;
  bool _error = false;
  String _errorMessage = "Unable to process, please try later";

  try{
    var Data = "username=$username&email=$email&password=$password";
    print(Data);
    var response = await API().post(api_manger.SIGNUP, Data);
    print("Status Code = ");
    print(response.statusCode);
    if(response.statusCode == 200){
      _error = false;
      _contnet = jsonDecode(response.body);
      print(_contnet);
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