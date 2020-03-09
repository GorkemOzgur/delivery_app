import 'package:delivery_app/model/Office.dart';
import 'package:delivery_app/model/OrderType.dart';
import 'package:delivery_app/model/PaymentMethod.dart';
import 'package:delivery_app/model/User.dart';

class Order{
  int id;
  String cargoId;
  User sender;
  User driver;
  Office office;
  String address;
  int expectedArrivalTime;
  bool canceled;
  bool completed;
  OrderType orderType;
  PaymentMethod paymentMethod;
  double price;
  int numberOfInstallment;
  String created;
  String accepted;
  String received;
  String delivered;



  Order(
  {this.id, this.cargoId, this.sender, this.driver, this.office,
      this.address, this.expectedArrivalTime, this.canceled, this.completed,
      this.orderType, this.paymentMethod, this.price, this.numberOfInstallment,
      this.created, this.accepted, this.received,
      this.delivered });


  factory Order.fromJson(Map<String, dynamic> val){
    return Order(
        id: val["id"],
        cargoId: val["cargoId"],
        sender: val["sender"] == null ? null : User.fromJson(val["sender"]),
        driver: val["driver"]== null ? null : User.fromJson(val["driver"]),
        office: val["office"] == null ? null : Office.fromJson(val["office"]),
        address: val["address"],
        expectedArrivalTime: val["expectedArrivalTime"],
        canceled: val["canceled"],
        completed: val["completed"],
        orderType: val["orderType"] == null ? null : OrderType.fromJson(val["orderType"]),
        paymentMethod: val["paymentMethod"] == null ? null : PaymentMethod.fromJson(val["paymentMethod"]),
        price: val["price"],
        numberOfInstallment: val["numberOfInstallment"],
        created: val["created"],
        accepted: val["accepted"],
        received: val["received"],
        delivered: val["delivered"]
    );
  }




}




