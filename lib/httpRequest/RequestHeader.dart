import 'dart:collection';

class RequestHeader {
  static Map<String, String> getRequestHeaderAsMap(){
    Map<String, String> header = new HashMap();
    header['Accept'] = 'application/json';
    header['Content-type'] = 'application/json';
    return header;
  }
}