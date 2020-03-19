import 'dart:convert';

import 'package:delivery_app/endpoint/OrderEndpoints.dart';
import 'package:delivery_app/httpRequest/RequestHeader.dart';
import 'package:delivery_app/model/Order.dart';
import 'package:delivery_app/serializer/OrderSerializer.dart';
import 'package:http/http.dart' as Http;

class OrderRequest{

  Future <List<Order>> driver() async{
    OrderEndpoints orderEndpoints = new OrderEndpoints("driver");

    Http.Response response =  await Http.get(
        orderEndpoints.ordersForDriver + "?orderType=food",
        headers: RequestHeader.getRequestHeaderWithAuthorization(),
    );
    Order order;
    if(response.statusCode == 200){
//      print(json.decode(response.body)[0]);
//      order = Order.fromJson(json.decode(response.body)[0]);
//      print("------------------------------------------");
        OrderSerializer orderSerializer = new OrderSerializer();
        List<Order> orders = orderSerializer.decodeOrderList(response.body);


        print("size of the list : " + orders.length.toString());
        for(Order order in orders){
          print(order.sender.name);
        }


        return orders;
    }

  }

}