// To parse this JSON data, do
//
//     final loginuser = loginuserFromJson(jsonString);

import 'dart:convert';

Loginuser loginuserFromJson(String str) => Loginuser.fromJson(jsonDecode(str));

String loginuserToJson(Loginuser data) => json.encode(data.toJson());

class Loginuser {
  Loginuser({
    required this.username,
    required this.password,
  });

  String username;
  String password;

  factory Loginuser.fromJson(Map<String, dynamic> json) => Loginuser(
        username: json["username"] == null ? null : json["username"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
      };
}
