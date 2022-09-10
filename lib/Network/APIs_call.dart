import 'dart:convert';

import 'package:be_pass/Network/APIs_manger.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:http/http.dart' as https;

class API{
  Future post(String apiurl, var Data)async{
    if(!await this._networkStatus())return Future(() {});
    try{
      return https.post(
        Uri.parse(api_manger.BASE_URL + apiurl),
        body:Data,
        headers: {"Content-Type": "application/json"},

      );
    }catch(e){
      print(["API exception get",e.toString()]);
    }
  }
  _networkStatus()=>InternetConnectionChecker().hasConnection;

}