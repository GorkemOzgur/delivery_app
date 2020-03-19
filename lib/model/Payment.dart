import 'package:delivery_app/model/PaymentMethod.dart';

class Payment{
  int id;
  double price;
  int numberOfInstallment;
  PaymentMethod paymentMethod;

  Payment({this.id, this.price, this.numberOfInstallment, this.paymentMethod});

  factory Payment.fromJson(Map<String, dynamic> val){
    return Payment(
      id: val["id"],
      price : val["price"],
      numberOfInstallment: val["numberOfInstallment"],
      paymentMethod: val["paymentMethod"] == null ? null : PaymentMethod.fromJson(val["paymentMethod"])
    );
  }


}