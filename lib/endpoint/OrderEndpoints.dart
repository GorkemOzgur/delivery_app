class OrderEndpoints{
  String ordersForDriver;
  String accept;
  String receive;
  String deliver;
  String previousForDriver;

  String ordersForAdmin;
  String transfer;
  String previousForAdmin;


  OrderEndpoints(String rank){
     if(rank == "admin"){
       ordersForAdmin = "http://167.172.166.88:8080/api/order/admin";
       transfer = "http://167.172.166.88:8080/api/order/transfer";
       previousForAdmin = "http://167.172.166.88:8080/api/order/previous/admin";
     }else { //driver
       ordersForDriver =  "http://167.172.166.88:8080/api/order/driver";
       accept = "http://167.172.166.88:8080/api/order/accept";
       receive = "http://167.172.166.88:8080/api/order/receive";
       deliver = "http://167.172.166.88:8080/api/order/deliver";
       previousForDriver = "http://167.172.166.88:8080/api/order/previous/driver";
     }
  }
}