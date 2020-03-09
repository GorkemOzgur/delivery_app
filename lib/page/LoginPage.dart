import 'package:delivery_app/httpRequest/LoginRequest.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginRequestState createState() => new _LoginRequestState();
}

class _LoginRequestState extends State<LoginPage>{
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
  int adminOrDriverKey = 0;  //0 ise Driver,   1 ise Admin
  String adminOrDriver ="driver";
  Color etoGreen = Color(0xff41B883);
  Color etoBlack = Color(0xff35495E);
  LoginRequest loginRequest = new LoginRequest();
  bool textFieldValidator = false;

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
                    color:   adminOrDriverKey == 0 ? etoGreen : etoBlack,
                    onPressed: (){
                      setState(() {
                        adminOrDriver="driver";
                        adminOrDriverKey = 0;
                      });
                    },

                    child: Text("Motorcu"),
                  ),

                  RaisedButton(
                    color: adminOrDriverKey == 1 ? etoGreen : etoBlack,

                    onPressed: (){
                      setState(() {
                        adminOrDriver="admin";
                        adminOrDriverKey = 1;
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


                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
                    child: ButtonTheme(
                      height: 50,
                      child: RaisedButton(
                        color: Color(0xff41B883),
                        onPressed: (){
                          loginRequest.login(context, _username.text,_password.text,adminOrDriver);

                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0),

                        ),
                        splashColor: etoBlack,

                        child: Text("Giriş Yap"),
                      ),
                    ),
                  ),

                ],),


            ],
          ),

        ),
      ),
    );
  }
}



