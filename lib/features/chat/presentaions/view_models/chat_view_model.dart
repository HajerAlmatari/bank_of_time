import 'package:bank_off_time/core/data/network/network_api_services.dart';
import 'package:bank_off_time/features/chat/data/repos/chat_repo.dart';
import 'package:bank_off_time/features/home/data/models/category.dart';
import 'package:bank_off_time/features/home/data/repos/home_repo.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final chatViewModel = ChangeNotifierProvider<ChatViewModel>((ref) {
  return ChatViewModel();
});


class ChatViewModel with ChangeNotifier{

  final ChatRepository _homeRepository = ChatRepository(NetworkApiServices());
  ChatViewModel(){
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