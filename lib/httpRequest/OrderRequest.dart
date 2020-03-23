import 'dart:convert';

import 'package:delivery_app/endpoint/OrderEndpoints.dart';
import 'package:delivery_app/httpRequest/RequestHeader.dart';
import 'package:delivery_app/model/Order.dart';
import 'package:delivery_app/serializer/OrderSerializer.dart';
import 'package:http/http.dart' as Http;

class OrderRequest{
  OrderEndpoints orderEndpoints = new OrderEndpoints("driver");

  Future <List<Order>> driver() async{
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

  Future<Order> accept(orderId, expectedArrivalTime) async{
    Http.Response response = await Http.put(
      orderEndpoints.accept + "?orderId=$orderId&expectedArrivalTime=$expectedArrivalTime",
      headers: RequestHeader.getRequestHeaderWithAuthorization(),
    );
    Order order ;
    if(response.statusCode == 201){
      order =  Order.fromJson(json.decode(response.body));
    }


    print("Status code: " + response.statusCode.toString());
    print("--------------------------------------------------------------------------------------");
    print(order.accepted);
    print(order.expectedArrivalTime);

    return null;
  }
  Future<Order> receive(orderId) async{
    Http.Response response = await Http.put(
      orderEndpoints.receive + "?orderId=$orderId",
      headers: RequestHeader.getRequestHeaderWithAuthorization(),
    );
    Order order ;
    if(response.statusCode == 201){
      order =  Order.fromJson(json.decode(response.body));
    }


    print("Status code: " + response.statusCode.toString());
    print("--------------------------------------------------------------------------------------");
    print(order.received);


    return null;
  }
  Future<Order> deliver(orderId) async{
    Http.Response response = await Http.put(
      orderEndpoints.deliver + "?orderId=$orderId",
      headers: RequestHeader.getRequestHeaderWithAuthorization(),
    );
    Order order ;
    if(response.statusCode == 201){
      order =  Order.fromJson(json.decode(response.body));
    }


    print("Status code: " + response.statusCode.toString());
    print("--------------------------------------------------------------------------------------");
    print(order.delivered);


    return null;
  }

}
