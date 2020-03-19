

import 'package:delivery_app/color/DeliveryColor.dart';
import 'package:delivery_app/httpRequest/OrderRequest.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';






class DriverHomePage extends StatefulWidget {
  @override
  _DriverHomePageState createState() => _DriverHomePageState();
}
class _DriverHomePageState extends State<DriverHomePage> {
 OrderRequest orderRequest = new OrderRequest();
 Future<dynamic> _futureOrder;

  @override
  void initState(){
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);


  }



  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomPadding: false,
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
                   DriverFood(context, orderRequest),
                ],
               )
             ],
          ),
        ),
      ),
    );
  }
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
                    'Geçmiş Siparişler',
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
DriverFood(BuildContext context, OrderRequest orderRequest){
  return FutureBuilder(
    future: orderRequest.driver(),
    // ignore: missing_return
    builder: (context, snapshot){
      if(snapshot.hasError){
        print("server hatası");
      }
      if (snapshot.hasData){
        return ListView.builder(
            reverse: false,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            itemCount: snapshot.data.length,
            itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child:  Material(
                      color: Colors.blueGrey[50],
                      elevation: 14.0,
                      borderRadius: BorderRadius.circular(5.0),
                      shadowColor: Color(0x802196F3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all( 8.0),
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                                            children: <Widget>[
                                              RichText(
                                                  text: TextSpan(
                                                      children:[
                                                        WidgetSpan(
                                                          child: Icon(Icons.business, size: 30, color:DeliveryColor.activeButtonColor),
                                                        ),
                                                        TextSpan(
                                                          text: " "+snapshot.data[index].sender.name,
                                                          style: TextStyle( fontSize: 15.0,color: Colors.black),
                                                        )
                                                      ]
                                                  )
                                              ),
                                              Container(

                                                child: Material(
                                                  color: DeliveryColor.passiveButtonColor,
                                                  borderRadius: BorderRadius.circular(3.0),
                                                  child: Text(" 19:53 ",
                                                    style: TextStyle( fontSize: 15.0, color: Colors.white),),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Align(
                                            alignment: Alignment.centerLeft ,
                                            child: RichText(
                                              text: TextSpan(
                                                  children: [
                                                    WidgetSpan(
                                                        child: Icon(Icons.location_on,size: 30, color: DeliveryColor.activeButtonColor,)
                                                    ),
                                                    TextSpan(
                                                      text: " "+snapshot.data[index].address,
                                                      style: TextStyle( fontSize: 15.0,color: Colors.black),
                                                    )
                                                  ]
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    ButtonTheme(
                                      child: ButtonBar(
                                        alignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          SizedBox(
                                            height: 35,
                                            width: MediaQuery.of(context).size.width/4,
                                            child: MaterialButton(
                                              onPressed:() {print("some");},
                                              child: Text(
                                                  " Kabul Et "
                                              ),
                                              disabledElevation: 1,
                                              color:  DeliveryColor.activeButtonColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: new BorderRadius.circular(5.0),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 35,
                                            width: MediaQuery.of(context).size.width/4,
                                            child: MaterialButton(
                                              onPressed:() {print("some");},
                                              child: Text(
                                                  " Teslim al "
                                              ),
                                              disabledElevation: 1,
                                              color:  DeliveryColor.passiveButtonColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: new BorderRadius.circular(5.0),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 35,
                                            width: MediaQuery.of(context).size.width/4,
                                            child: MaterialButton(
                                              onPressed:() {print("some");},
                                              child: Text(
                                                  " Teslim Et "
                                              ),
                                              disabledElevation: 1,
                                              color:  DeliveryColor.passiveButtonColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: new BorderRadius.circular(5.0),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                  ),
                ),
              );

            }
        );
      }
      if (!snapshot.hasData) {
        return Center(
          child: CircularProgressIndicator(
            backgroundColor: DeliveryColor.activeButtonColor,
          ),
        );
      }
    },
  );



}
























