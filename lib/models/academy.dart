// To parse this JSON data, do
//
//     final academy = academyFromJson(jsonString);

import 'dart:convert';

List<Academy> academyFromJson(String str) =>
    List<Academy>.from(json.decode(str).map((x) => Academy.fromJson(x)));

String academyToJson(List<Academy> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Academy {
  Academy({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory Academy.fromJson(Map<String, dynamic> json) => Academy(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
