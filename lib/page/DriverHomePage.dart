

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

  @override
  void initState(){
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

   _buildCargo() {
    return  FutureBuilder<dynamic>(
      future: orderRequest.driver(),
      builder: (context, snapshot) {

        if (snapshot.hasError) {
          print(snapshot.data);
          print(snapshot.error);
          return Text(
            'has error while response from server',
            style: TextStyle(color: Colors.white),
          );
        }
        else if (snapshot.hasData) {
          return ListView.builder(
            shrinkWrap: true,
            reverse: false,
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {



              return Column(
                children: <Widget>[
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.0),
                        color: Colors.white,
                      ),
                      height: 180,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                              '\t\tKargo Id: ${snapshot.data[index].id}',style: TextStyle(fontWeight: FontWeight.bold)
                              ),


                        ],
                      )
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              );
            },
          );


        }
        else if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.blue,
            ),
          );
        }

      },
    );
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
               _buildOrderOrHistory(),
               ListView(
                 shrinkWrap: true,
                 scrollDirection: Axis.vertical,
                 physics: NeverScrollableScrollPhysics(),
                 children: <Widget>[
                   DriverFood(context),
                   DriverFood(context),

                   DriverFood(context),

                   DriverFood(context),

                   DriverFood(context),

                   DriverFood(context),
                   DriverFood(context),
                   DriverFood(context),
          ],
               )
             ],


          ),

        ),
      ),
    );
  }
}
_buildOrderOrHistory() {
  return Center(
    child: ButtonBar(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        MaterialButton(
          minWidth: 183,
          color: Color(0xff41B883),
          child: Text(
            'Sipariş Talepleri',

          ),
          onPressed: () {

          },
        ),
        MaterialButton(
          minWidth: 183,

          child: Text(
            'Geçmiş Siparişler',

          ),
          color: Colors.blueGrey,
          onPressed: () {

          },
        ),
      ],
    ),
  );
}
DriverFood(BuildContext context){
  return Padding(
    padding: const EdgeInsets.all(16.0),
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
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all( 8.0),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    RichText(
                                      text: TextSpan(
                                      children:[
                                       WidgetSpan(
                                         child: Icon(Icons.business, size: 30, color: DeliveryColor.activeButtonColor,),
                                       ),
                                        TextSpan(
                                          text: ": Doci",
                                          style: TextStyle( fontSize: 15.0,color: Colors.black),
                                        )
                                     ]
                                  )
                                ),
SizedBox(
  width: 205,
),
                                    Container(

                                      child: Text('19:02',
                                        style: TextStyle( fontSize: 15.0,),),
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
                                          text: ": Atakent Mah/Zeynep Sk/ No: 9 Daire: 7",
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
                                  width: 99,
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
                                  width: 99,
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
                                  width: 99,
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

