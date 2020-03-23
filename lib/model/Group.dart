class Group{
  int id;
  String name;
  bool beInUse;
  String created;
  String updated;

  Group({this.id, this.name, this.beInUse, this.created, this.updated});


  factory Group.fromJson(Map<String, dynamic> val){
    if(val == null){
      return null;
    }
    return Group(
        id: val["id"],
        name: val["name"],
        beInUse: val["beInUse"],
        created: val["created"],
        updated: val["updated"]
    );
  }

}