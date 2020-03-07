class UserContext {
  static String authorization;

  String getAuthorization(){
    return authorization;
  }
  void setAuthorization(String authorization){
    UserContext.authorization = authorization;
  }

}