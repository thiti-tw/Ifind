import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ifind/page/home.dart';
import 'package:ifind/page/loginmodel.dart';
import 'package:ifind/page/userregister.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);
  //static const routeName = 'login';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var _username = TextEditingController();
  var _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    /*MediaQueryData queryData;
    queryData = MediaQuery.of(context);*/
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 80.0),
              new Text(
                'I-find',
                style: TextStyle(
                  color: Color.fromRGBO(100, 149, 237, 1),
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                ),
              ),
              SizedBox(height: 60.0),
              new Text(
                'Login',
                style: TextStyle(
                  color: Color.fromRGBO(100, 149, 237, 1),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                ),
              ),
              SizedBox(height: 10.0),

////////// ชื่อผู้ใช้
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    new Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200),
                      ),
                      //decoration: kBoxDecorationStyle ,
                      height: 70.0,
                      width: 300.0,
                      child: TextField(
                        controller: _username,
                        style: TextStyle(
                          color: Color.fromRGBO(30, 144, 255, 1),
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Kanit',
                        ),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'ชื่อผู้ใช้',
                            labelStyle: new TextStyle(
                                color: const Color.fromRGBO(100, 149, 237, 1)),
                            // hintText: 'Enter valid mail id as abc@gmail.com'
                            enabledBorder: new UnderlineInputBorder(
                                borderSide: new BorderSide(
                                    color: Color.fromRGBO(30, 144, 255, 1)))),
                      ),
                    ),
                  ],
                ),
              ),

/////////////รหัสผ่าน
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    new Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200),
                      ),
                      //decoration: kBoxDecorationStyle ,
                      height: 70.0,
                      width: 300.0,
                      child: TextField(
                        controller: _password,
                        style: TextStyle(
                          color: Color.fromRGBO(30, 144, 255, 1),
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Kanit',
                        ),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'รหัสผ่าน',
                            labelStyle: new TextStyle(
                                color: const Color.fromRGBO(30, 144, 255, 1)),
                            // hintText: 'Enter valid mail id as abc@gmail.com'
                            enabledBorder: new UnderlineInputBorder(
                                borderSide: new BorderSide(
                                    color: Color.fromRGBO(30, 144, 255, 1)))),
                        autofocus: false,
                        obscureText: true,
                      ),
                    ),
                  ],
                ),
              ),

              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 60.0),
                    Container(
                      height: 40.0,
                      width: 200.0,
                      child: new RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(
                                color: Color.fromRGBO(30, 144, 255, 1))),
                        onPressed: () async {
                          // print(_username);
                          var data = Loginuser(username: '', password: '');
                          data.username = _username.text;
                          data.password = _password.text;
                          var jsondata = loginuserToJson(data);
                          //print(jsondata);
                          var response = await http.post(
                              Uri.parse(
                                  'http://ifind.comsciproject.com/login/login'), //call login backend from server
                              body: jsondata,
                              headers: {
                                'Content-Type': 'application/json',
                              });
                          if (response.statusCode.toString() == "201") {
                            print('login success');
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home()));
                          } else {
                            print('login failed');
                          }
                        },
                        padding: EdgeInsets.all(10.0),
                        color: Color.fromRGBO(30, 144, 255, 1),
                        textColor: Colors.white,
                        child: Text("Confirm",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Roboto',
                            )),
                      ),
                    ),
                    SizedBox(height: 60.0),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Userregister()));
                        },
                        child: Text("create account"))
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
