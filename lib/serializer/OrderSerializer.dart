import 'dart:convert';

import 'package:delivery_app/model/Order.dart';

class OrderSerializer {

  List<Order> decodeOrderList(String responseBody){
    List<Order> orders = new List();
    Iterable iterable = json.decode(responseBody);
    for(int i=0;i<iterable.length;i++){
      orders.add(Order.fromJson(iterable.elementAt(i)));
    }

    for(Order order in orders)
      print(order.toString());

    return orders;
  }
}