
import 'dart:convert';

import 'package:be_pass/Network/APIs_call.dart';
import 'package:be_pass/Network/APIs_manger.dart';
import 'package:be_pass/Widgets/bottom_nav.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future certificate(
    Image image, String exp, String name, String certifications, String description)async{
  var _contnet;
  bool _error = false;
  String _errorMessage = "Unable to process, please try later";

  try{
    var data = jsonEncode({"image":image,"exp":exp,"name":name, "certifications":certifications,"description":description});

    print(" data is to be sent,$data");
    var response = await API().post(api_manger.SIGNUP, data);
    print("Status Code =${response.statusCode}");
    if(response.statusCode == 200){
      _error = false;
      _contnet = jsonDecode(response.body);
      print(_contnet);
      final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setString('token',_contnet['token']);
      Get.to(BottomBar());}else{
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


Future postResponse(
    {required String url, required FormData formData, var params}) async {
  debugPrint(url);
  debugPrint(formData.fields.toString());
  debugPrint(formData.boundary.toString());
  debugPrint(params.toString());
  try {
    final response = await dio.post(url,
        data: formData,
        queryParameters: params,
        options: Options(headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${Globals.token}',
        }));
    if (response.statusCode == 200) {
      print("Response ::: $response");
      return response.data;
    } else if (response.statusCode == 400) {
      print("Response ::: $response");
      return response.data;
    } else if (response.statusCode == 500) {
      Globals.showToastMethod(msg: "Internal server error");
      return null;
    } else if (response.statusCode == 404) {
      Globals.showToastMethod(msg: "This url is not found");
      return null;
    }
    return null;
  } catch (e) {
    debugPrint(e.toString());
    return null;
  }
}