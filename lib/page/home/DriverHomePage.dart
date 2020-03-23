

import 'package:delivery_app/color/DeliveryColor.dart';
import 'package:delivery_app/httpRequest/OrderRequest.dart';
import 'package:delivery_app/page/common/MyAppbar.dart';
import 'package:delivery_app/page/home/OrderRow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'AcceptPopup.dart';






class DriverHomePage extends StatefulWidget {
  @override
  _DriverHomePageState createState() => _DriverHomePageState();
}
class _DriverHomePageState extends State<DriverHomePage> {
 OrderRequest orderRequest = new OrderRequest();
 int expTime;

  @override
  void initState(){
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);


  }
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    OrderRow orderRow = new OrderRow();
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: new MyAppbar("previouspage", context).get(), //previouspage homepage olarak değiştirilecek,

        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff35495E),
                Color(0xff41B883)
              ],
            ),

        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: ListView(
             children: <Widget>[
               _buildOrderOrHistory(context),
               ListView(
                 shrinkWrap: true,
                 scrollDirection: Axis.vertical,
                 physics: NeverScrollableScrollPhysics(),
                 children: <Widget>[
                   orderRow.getFoodRows(context, orderRequest),
                ],
               )
             ],
          ),
        ),
      ),
    );
  }
 _buildOrderOrHistory(BuildContext context) {
   return Container(
     child: Column(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: <Widget>[
         SizedBox(
           width: MediaQuery.of(context).size.width,
           child: ButtonBar(
             mainAxisSize: MainAxisSize.min,
             children: <Widget>[
               SizedBox(
                 width: (MediaQuery.of(context).size.width/2)-22,
                 child: MaterialButton(
                   color: Color(0xff41B883),
                   child: Text(
                     'Sipariş Talepleri',
                   ),
                   onPressed: () {
                   },
                 ),
               ),
               SizedBox(
                 width: (MediaQuery.of(context).size.width/2)-22,
                 child: MaterialButton(
                   child: Text(
                     'Kargo Paketleri',
                   ),
                   color: Colors.blueGrey,
                   onPressed: () {
                   },
                 ),
               ),
             ],
           ),
         ),
       ],
     ),
   );
 }
}


























