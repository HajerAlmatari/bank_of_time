class Skill {
  int? id;
  String nameEn;
  String nameAr;
  String? imgPath;
  Category? category;

  Skill({
    this.id,
    required this.nameEn,
    required this.nameAr,
    this.imgPath,
    this.category,
  });

  factory Skill.fromMap(Map<String, dynamic> map) {

    Category? category;

    if(map.containsKey("category")){
      category = Category.fromMap(map["category"]);
    }
    return Skill(
      id: map["id"],
      nameEn: map["name_en"],
      nameAr: map["name_ar"],
      imgPath: map["img_path"],
      category: category,
    );
  }

  Map<String, dynamic> toMap() => {
    "id": id,
    "name_en": nameEn,
    "name_ar": nameAr,
    "img_path": imgPath,
    "category": category,
  };
}


class Category {
  int? id;
  String nameEn;
  String nameAr;
  String? imgPath;

  Category({
    this.id,
    required this.nameEn,
    required this.nameAr,
    this.imgPath,
  });

  factory Category.fromMap(Map<String, dynamic> map) => Category(
    id: map["id"],
    nameEn: map["name_en"],
    nameAr: map["name_ar"],
    imgPath: map["img_path"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name_en": nameEn,
    "name_ar": nameAr,
    "img_path": imgPath,
  };
}