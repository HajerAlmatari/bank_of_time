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

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.username,
    this.password,
    this.skills,
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
      skills: userSkills,
    );
  }

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "email": email,
    "username": username,
    "password": password,
    "skills": List<dynamic>.from(skills?.map((x) => x.toMap())??[]),
  };
}