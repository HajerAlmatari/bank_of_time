class Skill {
  int? id;
  String nameEn;
  String nameAr;
  String? imgPath;
  int? category;

  Skill({
    this.id,
    required this.nameEn,
    required this.nameAr,
    this.imgPath,
    this.category,
  });

  factory Skill.fromMap(Map<String, dynamic> map) => Skill(
    id: map["id"],
    nameEn: map["name_en"],
    nameAr: map["name_ar"],
    imgPath: map["img_path"],
    category: map["category"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name_en": nameEn,
    "name_ar": nameAr,
    "img_path": imgPath,
    "category": category,
  };
}