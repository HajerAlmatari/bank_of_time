import 'package:bank_off_time/core/data/network/network_api_services.dart';
import 'package:bank_off_time/features/auth/data/models/user_model.dart';
import 'package:bank_off_time/features/profile/features/skills/data/repos/skills_repo.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final sectionCategoryDetailsViewModel =
ChangeNotifierProvider.autoDispose.family<SectionCategoryDetailsViewModel, int>((ref, skillId) {
  return SectionCategoryDetailsViewModel(ref, skillId);
});


class SectionCategoryDetailsViewModel with ChangeNotifier{

  final Ref ref;
  final int skillId;
  final SkillsRepo _skillsRepo = SkillsRepo(NetworkApiServices());
  SectionCategoryDetailsViewModel(this.ref, this.skillId){
    init();
  }

  Future init()async{
    isLoading = true;
    await getData();
    isLoading = false;
  }

  Future getData()async{

    final result = await _skillsRepo.allUsersOfSpecificSkill(skillId);

    if(result != null){
      userList = result;
    }

  }

  List<User> _userList = [];
  List<User> get userList => _userList;
  set userList(List<User> list){
    _userList  = list;
    notifyListeners();
  }


  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value){
    _isLoading  = value;
    notifyListeners();
  }
}