import 'package:delivery_app/model/Group.dart';
import 'package:delivery_app/model/Office.dart';

class User{
  int id;
  String name;
  String lastname;
  Office office;
  Group group;
  bool beInUse;
  int displayPriority;
  String driverLastActiveLocation;
  String created;
  String updated;

  User({this.id, this.name, this.lastname, this.office, this.group, this.beInUse,
      this.displayPriority, this.driverLastActiveLocation, this.created,
      this.updated});

  factory User.fromJson(Map<String, dynamic> val){
    return User(
      id: val["id"], name: val["name"], lastname: val["lastname"], office: Office.fromJson(val["office"]),
      group: Group.fromJson(val["group"]), beInUse: val["beInUse"], displayPriority: val["displayPriority"],
      driverLastActiveLocation: val["driverLastActiveLocation"], created: val["created"], updated: val["updated"]
    );
  }


}