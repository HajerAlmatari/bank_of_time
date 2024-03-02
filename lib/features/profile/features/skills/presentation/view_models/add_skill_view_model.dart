import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/models.dart';

final addSkillViewModel = ChangeNotifierProvider<AddSkillViewModel>((ref) {
  return AddSkillViewModel(ref);
});


class AddSkillViewModel with ChangeNotifier{

  final ChangeNotifierProviderRef ref;
  AddSkillViewModel(this.ref){
    selectedSkillCategory = skillCategory.first;
  }

  List<SkillCategory> skillCategory = [
    SkillCategory(
      id: 1,
      name: "Information Technology"
    ),
    SkillCategory(
        id: 2,
        name: "Design"
    ),
    SkillCategory(
        id: 3,
        name: "Education"
    ),
  ];

  late SkillCategory? _selectedSkillCategory;
  SkillCategory? get selectedSkillCategory => _selectedSkillCategory;
   set selectedSkillCategory (SkillCategory? value){
     _selectedSkillCategory = value;
     notifyListeners();
   }



  List<SkillItem> skillItems = [
    SkillItem(
        id: 1,
        name: "Front-End"
    ),
    SkillItem(
        id: 2,
        name: "Back-End"
    ),
    SkillItem(
        id: 3,
        name: "DataBase"
    ),
  ];

  List<SkillItem?> _selectedSkillItems = [];
  List<SkillItem?> get selectedSkillItems => _selectedSkillItems;
  set selectedSkillItems (List<SkillItem?> value){
    _selectedSkillItems = value;
    notifyListeners();
  }

}