import 'package:equatable/equatable.dart';

class SkillCategory with EquatableMixin {
  String name;
  int id;

  SkillCategory({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [id, name];
}
