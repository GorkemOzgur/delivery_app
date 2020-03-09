class PaymentMethod{
  int id;
  String name;

  PaymentMethod({this.id, this.name});

  factory PaymentMethod.fromJson(Map<String, dynamic> val){
    return PaymentMethod(
      id: val["id"], name: val["name"]
    );
  }
}
