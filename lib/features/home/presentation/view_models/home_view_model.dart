import 'package:bank_off_time/core/data/network/network_api_services.dart';
import 'package:bank_off_time/features/home/data/models/category.dart';
import 'package:bank_off_time/features/home/data/repos/home_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeViewModel = ChangeNotifierProvider<HomeViewModel>((ref) {
  return HomeViewModel();
});


class HomeViewModel with ChangeNotifier{

  final HomeRepository _homeRepository = HomeRepository(NetworkApiServices());
  HomeViewModel(){
    init();
  }

  Future init()async{
    isLoading = true;
    await getData();
    isLoading = false;
  }

  Future getData()async{

    final result = await _homeRepository.getCategories();

    if(result != null && result.isNotEmpty){
      categoryList = result;
    }

  }

  List<CategoryModel> _categoryList = [];
  List<CategoryModel> get categoryList => _categoryList;
  set categoryList(List<CategoryModel> list){
    _categoryList  = list;
    notifyListeners();
  }


  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value){
    _isLoading  = value;
    notifyListeners();
  }

}