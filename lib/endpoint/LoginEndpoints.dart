class LoginEndpoints{
  static final String url  = "http://167.172.166.88:8080/api/userAccount/";

  static String getAdminLoginEndpoint(){
    return url + "admin/login";
  }
  static String getDriverLoginEndpoint(){
    return url + "driver/login";
  }


}