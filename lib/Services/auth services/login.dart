import 'dart:convert';

import 'package:be_pass/Network/APIs_call.dart';
import 'package:be_pass/Network/APIs_manger.dart';
import 'package:be_pass/Widgets/bottom_nav.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


Future login(
    String username,
    String password,
    ) async {
  var _content;
  bool _error = false;

  String _errorMessage = "Unable to process request, please try later!";

  try {
    var data = jsonEncode({"username":username,"password":password});
    print(data);
    var response = await API().post(api_manger.LOGIN, data);
    print('statusCode');
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      _error = false;
      _content = jsonDecode(response.body);
      final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setString('username',_content['username']);
      Get.to(BottomBar());
    } else {
      _error = true;
      _content = jsonDecode(response.body)['error'];
    }
  } catch (e) {
    _error = true;
    _content = _errorMessage;
  }
  return {
    "error": _error,
    "content": _content,
  };
}