import 'package:bank_off_time/core/models/skill_model.dart';
import 'package:bank_off_time/features/auth/data/models/user_model.dart';

class RequestModel {
  int id;
  User requester;
  User provider;
  Skill skill;
  dynamic description;
  DateTime createdAt;
  DateTime date;
  String price;
  int status;

  RequestModel({
    required this.id,
    required this.requester,
    required this.provider,
    required this.skill,
    required this.description,
    required this.createdAt,
    required this.date,
    required this.price,
    required this.status,
  });

  factory RequestModel.fromMap(Map<String, dynamic> map) => RequestModel(
    id: map["id"],
    requester: User.fromMap(map["requester"]),
    provider: User.fromMap(map["provider"]),
    skill: Skill.fromMap(map["skill"]),
    description: map["description"],
    createdAt: DateTime.parse(map["created_at"]),
    date: DateTime.parse(map["date"]),
    price: map["price"],
    status: map["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "requester_id": requester,
    "provider_id": provider,
    "skill_id": skill,
    "description": description,
    "created_at": createdAt.toIso8601String(),
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "price": price,
    "status": status,
  };


  Map<String, dynamic> toAcceptRequest() => {
    "id": id,
    "provider": provider.id,
    "requester": requester.id,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "price": price,
    "skill": skill.id,
    "status": 1,
  };

  bool get isPending => status == 0;
}
