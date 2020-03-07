import 'package:delivery_app/source/UserContext.dart';
import 'package:flutter/material.dart';


class DriverHomePage extends StatefulWidget {

  @override
  _DriverHomePage createState() => _DriverHomePage();
}
class _DriverHomePage extends State<DriverHomePage>{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose(){
    super.dispose();
  }



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
