// To parse this JSON data, do
//
//     final teacher = teacherFromJson(jsonString);

import 'dart:convert';

List<Teacher> teacherFromJson(String str) =>
    List<Teacher>.from(json.decode(str).map((x) => Teacher.fromJson(x)));

String teacherToJson(List<Teacher> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Teacher {
  Teacher({
    required this.id,
    required this.password,
    this.lastLogin,
    required this.isSuperuser,
    required this.firstName,
    required this.lastName,
    required this.isStaff,
    required this.isActive,
    required this.dateJoined,
    required this.email,
    required this.level,
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
  String level;
  List<dynamic> groups;
  List<dynamic> userPermissions;

  factory Teacher.fromJson(Map<String, dynamic> json) => Teacher(
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
        level: json["level"],
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
        "level": level,
        "groups": List<dynamic>.from(groups.map((x) => x)),
        "user_permissions": List<dynamic>.from(userPermissions.map((x) => x)),
      };
}
