import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ifind/model/postmodel.dart';

class Createpost extends StatefulWidget {
  Createpost({Key? key}) : super(key: key);

  @override
  State<Createpost> createState() => _CreatepostState();
}

class _CreatepostState extends State<Createpost> {
  var _title = TextEditingController();
  var _type = TextEditingController();
  var _gender = TextEditingController();
  var _age = TextEditingController();
  var _description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("create event"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                createtextfield("title", _title),
                createtextfield("description", _description),
                createtextfield("type", _type),
                createtextfield("gender", _gender),
                createtextfield("age", _age),
                SizedBox(height: 30),
                ElevatedButton(
                    onPressed: () async {
                      print(_title.text);
                      print(_type.text);
                      print(_gender.text);
                      print(_age.text);

                      var data = PostModel(
                        title: _title.text.toString(),
                        description: _description.text,
                        type: _type.text.toString(),
                        start: "2022-03-30 10:22:31",
                        end: "2022-03-30 10:22:31",
                        latitude: 100,
                        longitude: 100,
                        gender: _gender.text.toString(),
                        age: 20,
                        amount: 12,
                        picture: "",
                      );
                      print(data.toJson());
                      var response = await http.post(
                          Uri.parse(
                              'http://ifind.comsciproject.com/post/create'), //call create backend from server
                          body: postModelToJson(data),
                          headers: {
                            'Content-Type': 'application/json',
                          });
                      if (response.statusCode.toString() == "201") {
                        print('post success');
                        Navigator.pop(context);
                      } else {
                        print('post failed');
                      }
                      print(response.statusCode.toString());
                    },
                    child: Text("create"))
              ],
            ),
          ],
        ),
      ),
    );
  }

  Padding createtextfield(String title, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 300,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          controller: controller,
          //onChanged: (value) {},
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: title,
          ),
        ),
      ),
    );
  }
}
