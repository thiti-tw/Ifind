import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ifind/model/postmodel.dart';

class Editpost extends StatefulWidget {
  PostModel post;
  Editpost({required this.post});

  @override
  State<Editpost> createState() => _EditpostState();
}

class _EditpostState extends State<Editpost> {
  var _title = TextEditingController();
  var _type = TextEditingController();
  var _gender = TextEditingController();
  var _age = TextEditingController();
  var _description = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _title.text = widget.post.title;
    _description.text = widget.post.description;
    _type.text = widget.post.type;
    _gender.text = widget.post.gender;
    _age.text = widget.post.age.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("update event"),
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
                        id: widget.post.id,
                        title: _title.text.toString(),
                        description: _description.text,
                        type: _type.text.toString(),
                        start: widget.post.start,
                        end: widget.post.end,
                        latitude: widget.post.latitude,
                        longitude: widget.post.longitude,
                        gender: _gender.text.toString(),
                        age: widget.post.age,
                        amount: widget.post.amount,
                        picture: widget.post.picture,
                      );
                      print(data.toJson());
                      var response = await http.post(
                          Uri.parse(
                              'http://ifind.comsciproject.com/post/update'), //call update post backend from server
                          body: postModelToJsonUpdate(data),
                          headers: {
                            'Content-Type': 'application/json',
                          });
                      if (response.statusCode.toString() == "201") {
                        print('update post success');
                        Navigator.pop(context);
                      } else {
                        print('update post failed');
                      }
                      print(response.statusCode.toString());
                    },
                    child: Text("update"))
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
