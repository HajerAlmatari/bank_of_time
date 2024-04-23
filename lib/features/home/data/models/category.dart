import 'package:equatable/equatable.dart';

class CategoryModel with EquatableMixin{
  int id;
  String nameEn;
  String nameAr;
  String imgPath;
  List<CategoryModel>? skills;
  int? category;

  CategoryModel({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.imgPath,
    this.skills,
    this.category,
  });

  bool get hasSkills => skills?.isNotEmpty ?? false;


  factory CategoryModel.fromMap(Map<String, dynamic> json) => CategoryModel(
    id: json["id"]??0,
    nameEn: json["name_en"]??"",
    nameAr: json["name_ar"]??"",
    imgPath: json["img_path"]??"",
    skills: json["skills"] == null ? [] : List<CategoryModel>.from(json["skills"]!.map((x) => CategoryModel.fromMap(x))),
    category: json["category"]??0,
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name_en": nameEn,
    "name_ar": nameAr,
    "img_path": imgPath,
    "skills": skills == null ? [] : List<dynamic>.from(skills!.map((x) => x.toMap())),
    "category": category,
  };

  @override
  List<Object?> get props => [id, nameEn, nameEn];
}