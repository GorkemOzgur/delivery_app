import 'package:delivery_app/httpRequest/OrderRequest.dart';
import 'package:delivery_app/source/UserContext.dart';
import 'package:flutter/material.dart';


class DriverHomePage extends StatefulWidget {

  @override
  _DriverHomePage createState() => _DriverHomePage();
}
class _DriverHomePage extends State<DriverHomePage>{
  bool _sayfaGecisYuklenmeYuvarlagi = true ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _sayfaGecisYuklenmeYuvarlagi = false;
      });
    });

    OrderRequest orderRequest = new OrderRequest();
    orderRequest.driver();

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
        child: _sayfaGecisYuklenmeYuvarlagi ? CircularProgressIndicator() :Text(new UserContext().getAuthorization()),
      ),

    );
  }


}
