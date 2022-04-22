// To parse this JSON data, do
//
//     final student = studentFromJson(jsonString);

import 'dart:convert';

import 'package:flutterdjango/models/academy.dart';

List<Student> studentFromJson(String str) =>
    List<Student>.from(json.decode(str).map((x) => Student.fromJson(x)));

String studentToJson(List<Student> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Student {
  Student({
    required this.id,
    required this.password,
    required this.lastLogin,
    required this.isSuperuser,
    required this.firstName,
    required this.lastName,
    required this.isStaff,
    required this.isActive,
    required this.dateJoined,
    required this.email,
    required this.presenceAmount,
    required this.level,
    required this.academy,
    required this.groups,
    required this.userPermissions,
  });

  int id;
  String password;
  dynamic lastLogin;
  bool isSuperuser;
  String firstName;
  String lastName;
  bool isStaff;
  bool isActive;
  DateTime dateJoined;
  String email;
  int presenceAmount;
  String level;
  Academy academy;
  List<dynamic> groups;
  List<dynamic> userPermissions;

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        id: json["id"],
        password: json["password"],
        lastLogin: json["last_login"],
        isSuperuser: json["is_superuser"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        isStaff: json["is_staff"],
        isActive: json["is_active"],
        dateJoined: DateTime.parse(json["date_joined"]),
        email: json["email"],
        presenceAmount: json["presence_amount"],
        level: json["level"],
        academy: Academy.fromJson(json["academy"]),
        groups: List<dynamic>.from(json["groups"].map((x) => x)),
        userPermissions:
            List<dynamic>.from(json["user_permissions"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "password": password,
        "last_login": lastLogin,
        "is_superuser": isSuperuser,
        "first_name": firstName,
        "last_name": lastName,
        "is_staff": isStaff,
        "is_active": isActive,
        "date_joined": dateJoined.toIso8601String(),
        "email": email,
        "presence_amount": presenceAmount,
        "level": level,
        "academy": academy.toJson(),
        "groups": List<dynamic>.from(groups.map((x) => x)),
        "user_permissions": List<dynamic>.from(userPermissions.map((x) => x)),
      };
}
