import 'dart:collection';

import 'package:delivery_app/source/UserContext.dart';

class RequestHeader {
  static Map<String, String> getRequestHeaderAsMap(){
    Map<String, String> header = new HashMap();
    header['Accept'] = 'application/json';
    header['Content-type'] = 'application/json';
    return header;
  }

  static Map<String, String> getRequestHeaderWithAuthorization(){
    Map<String, String> header = new HashMap();
    header['Accept'] = 'application/json';
    header['Authorization'] = new UserContext().getAuthorization();
    return header;
  }
}