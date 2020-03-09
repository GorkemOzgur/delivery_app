class Office{
  int id;
  String name;
  String address;
  bool beInUse;
  String created;
  String updated;

  Office({this.id, this.name, this.address, this.beInUse, this.created,
      this.updated});


  factory Office.fromJson(Map<String, dynamic> val){
    if(val == null)
      return null;
    return Office(
        id: val["id"],
        name: val["name"],
        address: val["address"],
        beInUse: val["beInUse"],
        created: val["created"],
        updated: val["updated"]
    );
  }

}
