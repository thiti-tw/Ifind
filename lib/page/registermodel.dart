// To parse this JSON data, do
//
//     final register = registerFromJson(jsonString);

import 'dart:convert';

Register registerFromJson(String str) => Register.fromJson(json.decode(str));

String registerToJson(Register data) => json.encode(data.toJson());

class Register {
  Register({
    required this.username,
    required this.password,
    required this.name,
    required this.lastname,
  });

  String username;
  String password;
  String name;
  String lastname;

  factory Register.fromJson(Map<String, dynamic> json) => Register(
        username: json["username"] == null ? null : json["username"],
        password: json["password"],
        name: json["name"],
        lastname: json["lastname"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
        "name": name,
        "lastname": lastname,
      };
}
