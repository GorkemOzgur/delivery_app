import 'dart:collection';
import 'dart:convert';

import 'package:delivery_app/endpoint/LoginEndpoints.dart';
import 'package:delivery_app/httpRequest/RequestHeader.dart';
import 'package:delivery_app/page/DriverHomePage.dart';
import 'package:delivery_app/source/UserContext.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as Http;

class LoginRequest{
  void login(BuildContext context, String username, String password, String userRank)  async {
    String url;
    if(userRank == "driver")
      url  = LoginEndpoints.getDriverLoginEndpoint();
    else
      url = LoginEndpoints.getAdminLoginEndpoint();


    Http.Response response =  await Http.post(
        url,
        headers: RequestHeader.getRequestHeaderAsMap(),
        body: jsonEncode({'username': username, 'password': password}),
        encoding: Encoding.getByName('utf-8')
    );

    if(response.statusCode==200){
      new UserContext().setAuthorization(json.decode(response.body)['Authorization']);
      Navigator.pushReplacement(context, new MaterialPageRoute(builder: (BuildContext context) => new DriverHomePage()));
    }
  }

}