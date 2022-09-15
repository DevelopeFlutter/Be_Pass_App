import 'dart:convert';

import 'package:be_pass/Network/APIs_call.dart';
import 'package:be_pass/Network/APIs_manger.dart';
Future changeTimeFormat(bool value)async{
  var _contnet;
  bool _error = false;
  String _errorMessage = "Unable to process, please try later";
  try{
    var data = jsonEncode({"timeFormat24":value});
    print(" data is to be sent,$data");
    var response = await API().post(api_manger.CHANGETIMEFORMAT, data);
    print('statusCode is ${response.statusCode}');
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




Future changeCurrency(String value)async{


  var _contnet;
  bool _error = false;
  String _errorMessage = "Unable to process, please try later";
  try{
    var data = jsonEncode({"currencyName":value});
    print(" data is to be sent,$data");
    var response = await API().post(api_manger.SETCURRENCY, data);
    print('statusCode is ${response.statusCode}');
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

