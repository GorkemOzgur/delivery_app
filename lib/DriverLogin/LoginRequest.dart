import 'dart:collection';
import 'dart:convert';
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
  Map autKey;
  String parsingKey;

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
      parsingKey = autKey['Authorization'];
        Navigator.pushReplacement(context, new MaterialPageRoute(builder: (BuildContext context) => new DriverPage(ParsedKey:parsingKey,)));


    }
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    print(parsingKey);

  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(

      body: SingleChildScrollView(
        child: Container(

          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/2.5,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xff41B883),
                        Color(0xff35495E)
                      ],
                    ),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(90),
                        bottomRight: Radius.circular(90)
                    )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Spacer(),
                    Align(
                      alignment: Alignment.center,
                      child: Icon(Icons.motorcycle,
                        size: 90,
                        color: Colors.white,
                      ),
                    ),
                    Spacer(),

                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            bottom: 32,
                            right: 32
                        ),
                        child: Text('',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    color: Color(0xff41B883),
                    onPressed: (){
                      print("");
                    },

                    child: Text("Motorcu"),
                  ),

                  RaisedButton(
                    color: Color(0xff35495E),
                    onPressed: (){
                      print("");
                    },

                    child: Text("Admin"),
                  ),

                ],

              ),

              Container(
                height: MediaQuery.of(context).size.height/2,
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

                      keyboardType: TextInputType.number,
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
                      color: Color(0xff41B883),
                      onPressed: (){
                        login(_username.text,_password.text);

                      },

                      child: Text("Giriş Yap"),
                    ),

                  ],
                ),
              ),
            ],
          ),

        ),
      ),
    );
  }
}




