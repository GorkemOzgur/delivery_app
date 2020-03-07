import 'package:delivery_app/source/UserContext.dart';
import 'package:flutter/material.dart';


class DriverHomePage extends StatefulWidget {

  @override
  _DriverHomePage createState() => _DriverHomePage();
}
class _DriverHomePage extends State<DriverHomePage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      body: Center(
        child: Text(new UserContext().getAuthorization()),
      ),

    );
  }


}
