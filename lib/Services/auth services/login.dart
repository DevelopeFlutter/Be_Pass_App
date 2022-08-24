import 'dart:convert';

import 'package:be_pass/Network/APIs_call.dart';
import 'package:be_pass/Network/APIs_manger.dart';


Future login(
    String email,
    String password,
    ) async {
  var _content;
  bool _error = false;

  String _errorMessage = "Unable to process request, please try later!";

  try {
    var Data = "email=$email&password=$password";
    print(Data);
    var response = await API().post(api_manger.LOGIN, Data);

    print('statusCode');
    print(response.statusCode);
    if (response.statusCode == 200) {
      _error = false;
      _content = jsonDecode(response.body);
      print(jsonDecode(response.body)["success"]);

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