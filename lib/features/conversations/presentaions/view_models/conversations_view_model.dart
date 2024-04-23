import 'package:bank_off_time/core/data/network/network_api_services.dart';
import 'package:bank_off_time/features/conversations/data/repos/conversations_repo.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final conversationsViewModel = ChangeNotifierProvider.autoDispose<ConversationsViewModel>((ref) {
  return ConversationsViewModel();
});


class ConversationsViewModel with ChangeNotifier{

  final ConversationsRepository _homeRepository = ConversationsRepository(NetworkApiServices());
  ConversationsViewModel(){
    init();
  }

  Future init()async{
    isLoading = true;
    await getData();
    isLoading = false;
  }

  Future getData()async{



  }



  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value){
    _isLoading  = value;
    notifyListeners();
  }

}