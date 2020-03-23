import 'package:delivery_app/color/DeliveryColor.dart';
import 'package:delivery_app/page/home/DriverHomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAppbar{
  IconButton iconButton;
  BuildContext context;
  MyAppbar(String page, BuildContext context){
    this.context = context;
    if(page == "homepage")
      iconButton = IconButton(icon: Icon(Icons.event_note),color: Colors.white, onPressed: (){});
    else if(page == "previouspage")
      iconButton = IconButton(icon: Icon(Icons.event_note),color: Colors.white, onPressed: (){
        Navigator.pushReplacement(context, new MaterialPageRoute(builder: (BuildContext context) => new DriverHomePage()));

      });
  }

  get(){
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            DeliveryColor.activeButtonColor,
            DeliveryColor.darkBlue,
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          iconButton,
          Text('MOTORCU', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500,color: Colors.white),),

          Container(
            child: Material(

                color: DeliveryColor.darkBlue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),

                ),
                child: IconButton(icon: Icon(Icons.close),color: Colors.white, onPressed: (){})
            ),
          ),
        ],),
    );
  }

}