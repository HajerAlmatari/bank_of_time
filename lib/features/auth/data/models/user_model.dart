class User {
  int id;
  String name;
  String phone;
  String email;
  int userType;
  int status;
  dynamic description;

  User({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.userType,
    required this.status,
    required this.description,
  });


  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        phone: (json["phone"]).toString(),
        email: json["email"],
        userType: json["user_type"],
        status: json["status"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "email": email,
        "user_type": userType,
        "status": status,
        "description": description,
      };
}
