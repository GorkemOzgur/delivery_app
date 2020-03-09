
class OrderType{
  int id;
  String name;
  int priority;

  OrderType({this.id, this.name, this.priority});

  factory OrderType.fromJson(Map<String, dynamic> val){
    return OrderType(
        id: val["id"],
        name: val["name"],
        priority: val["priority"]
    );
  }
}