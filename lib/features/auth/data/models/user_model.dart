import 'dart:convert';

import 'package:bank_off_time/core/models/skill_model.dart';

User userFromJson(String str) => User.fromMap(json.decode(str));

String userToJson(User data) => json.encode(data.toMap());

class User {
  int id;
  String name;
  String email;
  String username;
  String? password;
  List<Skill>? skills;
  int? type;
  dynamic balance;
  int? status;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.username,
    this.password,
    this.skills,
    this.balance,
    this.type,
    this.status,
  });

  factory User.fromMap(Map<String, dynamic> map) {

    List<Skill> userSkills = [];

    if(map.containsKey("skills")){
      userSkills = List<Skill>.from(map["skills"].map((x) => Skill.fromMap(x)));
    }
    return User(
      id: map["id"],
      name: map["name"],
      email: map["email"],
      username: map["username"],
      password: map["password"],
      balance: map["balance"],
      status: map["status"],
      type: map["type"],
      skills: userSkills,
    );
  }

  Map<String, dynamic> toMap([bool toUpdate = false]) {

    if(toUpdate){
      return {
        "name": name,
        "email": email,
        "username": username,
        "balance": balance,
        "status": status,
        "type": type,
      };
    }

    return {
      "id": id,
      "name": name,
      "email": email,
      "username": username,
      "password": password,
      "skills": List<dynamic>.from(skills?.map((x) => x.toMap())??[]),
    };
  }
}