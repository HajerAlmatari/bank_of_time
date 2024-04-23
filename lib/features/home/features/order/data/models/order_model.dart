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

  factory OrderModel.fromMap(Map<String, dynamic> map) => OrderModel(
    providerId: map["provider_id"],
    requesterId: map["requester_id"],
    date: map["date"],
    price: map["price"]?.toDouble(),
    skillId: map["skill_id"],
  );

  Map<String, dynamic> toMap() => {
    "provider": providerId,
    "requester": requesterId,
    "date": date,
    "price": price,
    "skill": skillId,
  };
}