import 'package:delivery_app/color/DeliveryColor.dart';
import 'package:delivery_app/httpRequest/OrderRequest.dart';
import 'package:delivery_app/page/home/AcceptPopup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderRow {

  getFoodRows(BuildContext context, OrderRequest orderRequest){
    AcceptPopup acceptPopup = new AcceptPopup(context, orderRequest);
    return FutureBuilder(
      future: orderRequest.driver(),
      // ignore: missing_return
      builder: (context, snapshot){
        if(snapshot.hasError){
          print("server hatası");
        }
        if (snapshot.hasData){
          return Scrollbar(
            child: ListView.builder(
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
                                                      child: Text(DateFormat(" HH:mm ").format(DateFormat("MMM dd, yyyy, HH:mm:ss a").parse(snapshot.data[index].created)),
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
                                                  onPressed: snapshot.data[index].accepted == null
                                                      ?
                                                      () { acceptPopup.getPopUp(snapshot.data[index].id); } :(){ showDialog(
                                                      context: context,
                                                      builder: (BuildContext context){
                                                        return AlertDialog(
                                                          title: Text("Sipariş önceden kabul edilmiş"),
                                                          content: Text("Sipariş için verdiğiniz süre "+snapshot.data[index].expectedArrivalTime.toString()+" dakikadır"),

                                                        );
                                                      }
                                                  );},
                                                  child: Text(
                                                      snapshot.data[index].accepted == null
                                                          ? " Kabul Et " : snapshot.data[index].expectedArrivalTime.toString()+"dk"
                                                  ),
                                                  disabledElevation: 1,
                                                  color: snapshot.data[index].accepted == null
                                                      ? DeliveryColor.activeButtonColor : DeliveryColor.passiveButtonColor,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: new BorderRadius.circular(5.0),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 35,
                                                width: MediaQuery.of(context).size.width/4,
                                                child: MaterialButton(
                                                  onPressed:snapshot.data[index].accepted != null && snapshot.data[index].received == null
                                                      ?
                                                      () { orderRequest.receive(snapshot.data[index].id); } :
                                                  snapshot.data[index].accepted == null
                                                      ? (){
                                                    showDialog(
                                                      context: context,
                                                      builder: (BuildContext context){
                                                        return AlertDialog(
                                                          title: Text("Sipariş kabul edilmemiş"),
                                                          content: Text("Siparişi kabul ettikten sonra teslim alabilirsiniz"),

                                                        );
                                                      }
                                                  );}
                                                  : (){
                                                    showDialog(
                                                      context: context,
                                                      builder: (BuildContext context){
                                                        return AlertDialog(
                                                          title: Text("Sipariş önceden teslim alınmış"),
                                                          content: Text("Siparişiniz hali hazırda teslim alınmış. Tekrar kontrol ediniz"),

                                                        );
                                                      }
                                                  );},
                                                  child: Text(snapshot.data[index].received == null ?
                                                      " Teslim al " : " Alındı "
                                                  ),
                                                  disabledElevation: 1,
                                                  color: snapshot.data[index].accepted != null && snapshot.data[index].received == null ? DeliveryColor.activeButtonColor : DeliveryColor.passiveButtonColor,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: new BorderRadius.circular(5.0),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 35,
                                                width: MediaQuery.of(context).size.width/4,
                                                child: MaterialButton(
                                                  onPressed:snapshot.data[index].accepted != null && snapshot.data[index].received != null
                                                      ?
                                                      () { orderRequest.deliver(snapshot.data[index].id); } :(){ showDialog(
                                                      context: context,
                                                      builder: (BuildContext context){
                                                        return AlertDialog(
                                                          title: Text("Sipariş çoktan tamamlanmış"),
                                                          content: Text("Sipraiş tamamlanmış. Sayfayı yenileyiniz"),

                                                        );
                                                      }
                                                  );},
                                                  child: Text(
                                                      " Teslim Et "
                                                  ),
                                                  disabledElevation: 1,
                                                  color:  snapshot.data[index].accepted != null && snapshot.data[index].received != null ? DeliveryColor.activeButtonColor : DeliveryColor.passiveButtonColor,
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
            ),
          );
        }
        if (!snapshot.hasData) {
          return Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // This makes the blue container full width.
                Expanded(
                  child: Container(
                    height: 50.0,
                    child: Center(
                      child: CircularProgressIndicator(
                        backgroundColor: DeliveryColor.activeButtonColor,

                      ),
                    ),
                  ),
                ),
              ],
            ),
          );

        }
      },
    );



  }


  getCargoRows(BuildContext context, OrderRequest orderRequest){

  }
}