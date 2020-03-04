class Authorization{
   String auth;
  Authorization({this.auth});
  factory Authorization.fromJson(Map<String, dynamic> json){
    return Authorization(
      auth: json['Authorizaton'],
    );
  }

}