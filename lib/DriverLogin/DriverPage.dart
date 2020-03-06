import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'LoginRequest.dart';


class DriverPage extends StatefulWidget {

  final String ParsedKey;


  const DriverPage({Key key, this.ParsedKey}) : super(key: key);

   @override
  _DriverPage createState() => _DriverPage();
}
class _DriverPage extends State<DriverPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      body: Center(
        child: Text(widget.ParsedKey),
      ),

    );
  }


}




