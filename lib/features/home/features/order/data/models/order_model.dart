class OrderModel {
  int providerId;
  int requesterId;
  String date;
  double price;
  int skillId;

  OrderModel({
    required this.providerId,
    required this.requesterId,
    required this.date,
    required this.price,
    required this.skillId,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
    providerId: json["provider_id"],
    requesterId: json["requester_id"],
    date: json["date"],
    price: json["price"]?.toDouble(),
    skillId: json["skill_id"],
  );

  Map<String, dynamic> toJson() => {
    "provider_id": providerId,
    "requester_id": requesterId,
    "date": date,
    "price": price,
    "skill_id": skillId,
  };
}