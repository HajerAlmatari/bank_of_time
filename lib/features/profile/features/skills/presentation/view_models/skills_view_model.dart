import 'package:bank_off_time/core/data/network/network_api_services.dart';
import 'package:bank_off_time/core/models/skill_model.dart';
import 'package:bank_off_time/core/providers/session_provider.dart';
import 'package:bank_off_time/features/profile/features/skills/data/repos/skills_repo.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final skillsViewModel = ChangeNotifierProvider.autoDispose<SkillsViewModel>((ref) {
  return SkillsViewModel(ref);
});


class SkillsViewModel with ChangeNotifier{

  final Ref ref;
  final SkillsRepo _skillsRepo = SkillsRepo(NetworkApiServices());
  SkillsViewModel(this.ref){
    init();
  }

  Future init()async{
    isLoading = true;
    await getData();
    isLoading = false;
  }

  Future getData()async{

    final result = await _skillsRepo.userWithSkills(ref.watch(sessionProvider).authUser!.id);

    if(result != null){
      skillsList = result.skills??[];
    }

  }

  List<Skill> _skillsList = [];
  List<Skill> get skillsList => _skillsList;
  set skillsList(List<Skill> list){
    _skillsList  = list;
    notifyListeners();
  }


  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value){
    _isLoading  = value;
    notifyListeners();
  }

}