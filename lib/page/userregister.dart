import 'package:flutter/material.dart';
import 'package:ifind/page/registermodel.dart';
import 'package:http/http.dart' as http;

class Userregister extends StatefulWidget {
  Userregister({Key? key}) : super(key: key);

  @override
  State<Userregister> createState() => _UserregisterState();
}

class _UserregisterState extends State<Userregister> {
  var _username = TextEditingController();
  var _password = TextEditingController();
  var _name = TextEditingController();
  var _lastname = TextEditingController();

  @override
  Widget build(BuildContext context) {
    /*MediaQueryData queryData;
    queryData = MediaQuery.of(context);*/
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(100, 149, 237, 1),
        //centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 80.0),
              new Text(
                ' Sign up',
                style: TextStyle(
                  color: Color.fromRGBO(100, 149, 237, 1),
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                ),
              ),
              SizedBox(height: 80.0),
////////// ชื่อ-สกุล
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //SizedBox(width: 20.0, height: 40.0),
                        new Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(200),
                          ),
                          //decoration: kBoxDecorationStyle ,
                          height: 70.0,
                          width: 300.0,
                          child: TextField(
                            controller: _name,
                            style: TextStyle(
                              color: Color.fromRGBO(100, 149, 237, 1),
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Kanit',
                            ),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'ชื่อ',
                                labelStyle: new TextStyle(
                                    color:
                                        const Color.fromRGBO(100, 149, 237, 1)),
                                // hintText: 'Enter valid mail id as abc@gmail.com'
                                enabledBorder: new UnderlineInputBorder(
                                    borderSide: new BorderSide(
                                        color:
                                            Color.fromRGBO(100, 149, 237, 1)))),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //SizedBox(width: 30.0, height: 40.0),
                        new Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(200),
                          ),
                          //decoration: kBoxDecorationStyle ,
                          height: 70.0,
                          width: 300.0,
                          child: TextField(
                            controller: _lastname,
                            style: TextStyle(
                              color: Color.fromRGBO(100, 149, 237, 1),
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Kanit',
                            ),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'นามสกุล',
                                labelStyle: new TextStyle(
                                    color:
                                        const Color.fromRGBO(30, 144, 255, 1)),
                                // hintText: 'Enter valid mail id as abc@gmail.com'
                                enabledBorder: new UnderlineInputBorder(
                                    borderSide: new BorderSide(
                                        color:
                                            Color.fromRGBO(30, 144, 255, 1)))),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

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
                          print(_username);
                          var data = Register(
                              username: '',
                              password: '',
                              name: '',
                              lastname: '');
                          data.username = _username.text;
                          data.password = _password.text;
                          data.name = _name.text;
                          data.lastname = _lastname.text;
                          var jsondata = registerToJson(data);
                          print(jsondata);
                          var response = await http.post(
                              Uri.parse(
                                  'http://ifind.comsciproject.com/user/register'), //call register backend from server
                              body: jsondata,
                              headers: {
                                'Content-Type': 'application/json',
                              });
                          if (response.statusCode.toString() == "201") {
                            print('register success');
                            Navigator.pop(context);
                          } else {
                            print('register failed');
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
                    SizedBox(height: 100.0),
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
