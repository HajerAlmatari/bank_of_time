import 'package:equatable/equatable.dart';

class SkillItem with EquatableMixin {
  String name;
  int id;

  SkillItem({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [id, name];
}
