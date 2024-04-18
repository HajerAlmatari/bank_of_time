import 'package:bank_off_time/core/data/network/network_api_services.dart';
import 'package:bank_off_time/core/providers/session_provider.dart';
import 'package:bank_off_time/core/utils/cherry_toast_util.dart';
import 'package:bank_off_time/features/home/data/models/category.dart';
import 'package:bank_off_time/features/profile/features/skills/data/repos/skills_repo.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


final addSkillViewModel = ChangeNotifierProvider.autoDispose<AddSkillViewModel>((ref) {
  return AddSkillViewModel(ref);
});


class AddSkillViewModel with ChangeNotifier{

  final SkillsRepo _myRepo = SkillsRepo(NetworkApiServices());


  final ChangeNotifierProviderRef ref;
  AddSkillViewModel(this.ref){
    init();
  }

  Future init()async{
    isLoading = true;
    await getData();
    isLoading = false;
  }

  Future getData()async{

    final result = await _myRepo.getCategories();

    if(result != null && result.isNotEmpty){
      skillCategory = result;
    }

  }


  List<CategoryModel> _skillCategory = [];
  List<CategoryModel> get skillCategory => _skillCategory;
  set skillCategory(List<CategoryModel> list){
    _skillCategory = list;
    selectedSkillCategory = list.first;
    notifyListeners();
  }

  CategoryModel? _selectedSkillCategory;
  CategoryModel? get selectedSkillCategory => _selectedSkillCategory;
   set selectedSkillCategory (CategoryModel? value){
     _selectedSkillCategory = value;
     _selectedSkillItems.clear();
     skillItems = List.from(value?.skills??[]);
     notifyListeners();
   }



  List<CategoryModel>? _skillItems;
  List<CategoryModel> get skillItems => _skillItems??[];
  set skillItems(List<CategoryModel> list){
    _skillItems = list;

    notifyListeners();
  }


  List<CategoryModel?> _selectedSkillItems = [];
  List<CategoryModel?> get selectedSkillItems => _selectedSkillItems;
  set selectedSkillItems (List<CategoryModel?> value){
    _selectedSkillItems = value;
    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value){
    _isLoading  = value;
    notifyListeners();
  }

  bool _isBusy = false;
  bool get isBusy => _isBusy;
  set isBusy(bool value){
    _isBusy  = value;
    notifyListeners();
  }

  Future addSkills(BuildContext context)async{


    final data = {
      "person_id" : ref.watch(sessionProvider).authUser?.id,
      "skill_ids" : _selectedSkillItems.map((e) => e?.id).toList(),
    };

    isBusy = true;
    final result = await _myRepo.addSkills(data);

    isBusy = false;

    print("result is $result");

    if(result){
      Navigator.pop(context);
      ToastUtil.showSuccess("Added Success", context);
    }

  }

}