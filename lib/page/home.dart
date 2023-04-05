import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ifind/model/postmodel.dart';
import 'package:ifind/page/login.dart';
import 'package:ifind/page/post_create.dart';
import 'package:ifind/page/post_edit.dart';

import 'package:ifind/page/userregister.dart';

class Home extends StatefulWidget {
  static const routeName = '/';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  /*var _username = TextEditingController();
  var _password = TextEditingController();
  var _name = TextEditingController();
  var _lastname = TextEditingController();*/
  late List<PostModel> posts;

  Future fetchdata() async {
    //get post
    var response = await http
        .get(Uri.parse('http://ifind.comsciproject.com/post/get'), headers: {
      'Content-Type': 'application/json',
    });
    if (response.statusCode.toString() == "200") {
      print('get post success');
      print(response.body);
      posts = postModelFromJson(response.body);
      return response;
    } else {
      print('get post failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    /*MediaQueryData queryData;
    queryData = MediaQuery.of(context);*/
    return Scaffold(
      drawer: createdrawer(context),
      appBar: appbar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20.0),
                TextButton(
                    onPressed: () async {
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Createpost()));
                      setState(() {});
                    },
                    child: Text("create event")),
                SizedBox(height: 10.0),
              ],
            ),
            FutureBuilder(
                future: fetchdata(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return Column(
                    children: List.generate(
                        posts.length, (index) => createCard(index)),
                  );
                })
          ],
        ),
      ),
    );
  }

  Padding createCard(int index) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Card(
        elevation: 5,
        child: Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(7.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(posts[index].title,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.amber),
                        ),
                        onPressed: () async {
                          await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Editpost(post: posts[index])));
                          setState(() {});
                        },
                        child: Text("edit"))
                  ],
                )),
            Padding(
                padding: const EdgeInsets.fromLTRB(14, 7, 7, 7),
                child: Row(
                  children: <Widget>[
                    Text(posts[index].description,
                        style: TextStyle(fontSize: 16)),
                  ],
                )),
            Padding(
                padding: const EdgeInsets.all(7.0),
                child: Row(
                  children: const <Widget>[
                    Padding(
                      padding: EdgeInsets.all(7.0),
                      child: Icon(Icons.thumb_up),
                    ),
                    Padding(
                      padding: EdgeInsets.all(7.0),
                      child: Text(
                        'Like',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(7.0),
                      child: Icon(Icons.comment),
                    ),
                    Padding(
                      padding: EdgeInsets.all(7.0),
                      child: Text('Comments', style: TextStyle(fontSize: 18.0)),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }

  AppBar appbar() {
    return AppBar(
      backgroundColor: Color.fromRGBO(100, 149, 237, 1),
      centerTitle: true,
      title: Text("Home"),
    );
  }

  Drawer createdrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromRGBO(100, 149, 237, 1),
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: const Text('Logout'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Login()));
            },
          ),
        ],
      ),
    );
  }
}
