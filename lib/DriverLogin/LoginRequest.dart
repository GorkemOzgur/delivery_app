import 'dart:collection';
import 'dart:convert';
import 'package:delivery_app/DriverLogin/ApiEndpoints.dart';
import 'package:delivery_app/DriverLogin/Authorization.dart';
import 'package:delivery_app/DriverLogin/DriverPage.dart';
import 'package:http/http.dart' as Http;
import 'package:flutter/material.dart';



class LoginRequest extends StatefulWidget {
  @override
  _LoginRequestState createState() => new _LoginRequestState();
}
class _LoginRequestState extends State<LoginRequest>{


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose(){
    super.dispose();
  }


  static final TextEditingController _username = new TextEditingController();
  static final TextEditingController _password = new TextEditingController();
  String get username => _username.text;
  String get password => _password.text;
  Map autKey;
  String calisKey;
  ApiEndpoints apiEndpoints = new ApiEndpoints();

  void login(String username, String password)  async {
    String url3 = 'http://167.172.166.88:8080/api/userAccount/driver/login';
    Map<String, String> headers = new HashMap();
    headers['Accept'] = 'application/json';
    headers['Content-type'] = 'application/json';
    Http.Response response =  await Http.post(
        url3,
        headers: headers,
        body: jsonEncode({'username': username, 'password': password}),
        encoding: Encoding.getByName('utf-8')
    );

    if(response.statusCode==200){
      autKey=json.decode(response.body);
      calisKey = autKey['Authorization'];
        Navigator.pushReplacement(context, new MaterialPageRoute(builder: (BuildContext context) => new DriverPage(calislutfen:calisKey,)));


    }
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    print(calisKey);

  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(

      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _username,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Kullanıcı adını giriniz",
                  labelText: "Kullanıcı adı",
                ),
              ),

              SizedBox(
                height: 20.0,
              ),
              TextField(
                controller: _password,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Şifrenizi giriniz",
                  labelText: "Şifre",
                ),
              ),

              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                color: Colors.tealAccent,
                onPressed:() =>
                    login(_username.text,_password.text),
                child: Text("Submit"),
              ),

            ],
          ),
        ),
      ),
    );
  }
}




