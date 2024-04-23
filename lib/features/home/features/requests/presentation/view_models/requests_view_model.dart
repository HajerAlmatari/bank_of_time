import 'package:bank_off_time/core/data/network/network_api_services.dart';
import 'package:bank_off_time/core/models/skill_model.dart';
import 'package:bank_off_time/core/providers/session_provider.dart';
import 'package:bank_off_time/features/home/features/requests/data/models/request_model.dart';
import 'package:bank_off_time/features/home/features/requests/data/repos/requests_repo.dart';
import 'package:bank_off_time/features/profile/features/skills/data/repos/skills_repo.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final requestsViewModel = ChangeNotifierProvider.autoDispose<RequestsViewModel>((ref) {
  return RequestsViewModel(ref);
});


class RequestsViewModel with ChangeNotifier{

  final Ref ref;
  final RequestsRepo _myRepo = RequestsRepo(NetworkApiServices());
  RequestsViewModel(this.ref){
    init();
  }

  Future init()async{
    isLoading = true;
    await getData();
    isLoading = false;
  }

  Future refresh()async{
    isLoading = true;
    await getData();
    isLoading = false;
  }

  Future getData()async{

    final result = await _myRepo.getAllRequests(userId : ref.watch(sessionProvider).authUser!.id);

    if(result != null){
      requestsList = result;
    }

  }

  List<RequestModel> _requestsList = [];
  List<RequestModel> get requestsList => _requestsList;
  set requestsList(List<RequestModel> list){
    _requestsList  = list;
    notifyListeners();
  }


  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value){
    _isLoading  = value;
    notifyListeners();
  }

}