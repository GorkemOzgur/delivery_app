import 'dart:collection';
import 'dart:convert';
import 'package:delivery_app/DriverLogin/DriverPage.dart';
import 'package:flutter/cupertino.dart';
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
  int AdminOrDriverKey = 0;  //0 ise Driver,   1 ise Admin
  String AdminOrDriver ="driver";
  Color etoGreen = Color(0xff41B883);
  Color etoBlack = Color(0xff35495E);

  void login(String username, String password, String AdminOrDriver)  async {
    String url3 = 'http://167.172.166.88:8080/api/userAccount/$AdminOrDriver/login';
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
                    color:   AdminOrDriverKey == 0 ? etoGreen : etoBlack,
                    onPressed: (){
                      setState(() {
                        AdminOrDriver="driver";
                        AdminOrDriverKey = 0;
                      });
                    },

                    child: Text("Motorcu"),
                  ),

                  RaisedButton(
                    color: AdminOrDriverKey == 1 ? etoGreen : etoBlack,

                    onPressed: (){
                      setState(() {
                        AdminOrDriver="admin";
                        AdminOrDriverKey = 1;
                      });
                    },

                    child: Text("Admin"),
                  ),

                ],

              ),

              Container(

                padding: EdgeInsets.all(25),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    TextField(
                      controller: _username,

                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
                        prefixIcon: Icon(Icons.person,color: Color(0xff41B883),),
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
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
                        prefixIcon: Icon(Icons.vpn_key,color: Color(0xff41B883),),
                        hintText: "Şifrenizi giriniz",
                        labelText: "Şifre",
                      ),
                    ),

                    SizedBox(
                      height: 20.0,
                    ),
                    ButtonTheme(
                      height: 50,
                      minWidth: 340,
                      child: RaisedButton(
                        color: Color(0xff41B883),
                        onPressed: (){
                          login(_username.text,_password.text,AdminOrDriver);

                        },

                        child: Text("Giriş Yap"),
                      ),
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




