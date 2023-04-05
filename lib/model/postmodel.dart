// To parse this JSON data, do
//
//     final postModel = postModelFromJson(jsonString);

import 'dart:convert';

List<PostModel> postModelFromJson(String str) =>
    List<PostModel>.from(json.decode(str).map((x) => PostModel.fromJson(x)));

String postModelToJson(PostModel data) => json.encode(data.toJson());
String postModelToJsonUpdate(PostModel data) =>
    json.encode(data.toJsonUpdate());

class PostModel {
  PostModel({
    this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.start,
    required this.end,
    required this.latitude,
    required this.longitude,
    required this.gender,
    required this.age,
    required this.amount,
    required this.picture,
  });

  dynamic id;
  String title;
  String description;
  String type;
  String start;
  String end;
  int latitude;
  int longitude;
  String gender;
  int age;
  int amount;
  dynamic picture;

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        type: json["type"],
        start: json["start"],
        end: json["end"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        gender: json["gender"],
        age: json["age"],
        amount: json["amount"],
        picture: json["picture"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "type": type,
        "start": start,
        "end": end,
        "latitude": latitude,
        "longitude": longitude,
        "gender": gender,
        "age": age,
        "amount": amount,
        "picture": picture,
      };

  Map<String, dynamic> toJsonUpdate() => {
        "id": id,
        "title": title,
        "description": description,
        "type": type,
        "start": start,
        "end": end,
        "latitude": latitude,
        "longitude": longitude,
        "gender": gender,
        "age": age,
        "amount": amount,
        "picture": picture,
      };
}
