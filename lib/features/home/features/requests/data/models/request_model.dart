class RequestModel {
  int id;
  int requesterId;
  int providerId;
  int skillId;
  dynamic description;
  DateTime createdAt;
  DateTime date;
  String price;
  int status;

  RequestModel({
    required this.id,
    required this.requesterId,
    required this.providerId,
    required this.skillId,
    required this.description,
    required this.createdAt,
    required this.date,
    required this.price,
    required this.status,
  });

  factory RequestModel.fromMap(Map<String, dynamic> map) => RequestModel(
    id: map["id"],
    requesterId: map["requester_id"],
    providerId: map["provider_id"],
    skillId: map["skill_id"],
    description: map["description"],
    createdAt: DateTime.parse(map["created_at"]),
    date: DateTime.parse(map["date"]),
    price: map["price"],
    status: map["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "requester_id": requesterId,
    "provider_id": providerId,
    "skill_id": skillId,
    "description": description,
    "created_at": createdAt.toIso8601String(),
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "price": price,
    "status": status,
  };

  bool get isPending => status == 0;
}
