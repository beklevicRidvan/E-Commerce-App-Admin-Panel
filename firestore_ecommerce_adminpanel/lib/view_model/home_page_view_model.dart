import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../repository/database_repository.dart';
import '../tools/locator.dart';
import '../view/categories_page_view.dart';
import '../view/users_page_view.dart';
import 'categories_page_view_model.dart';
import 'users_page_view_model.dart';

class HomePageViewModel with ChangeNotifier{
  int _userCount = 0;
  int _categoryCount = 0;


  final _repository = locator<DatabaseRepository>();
  int get userCount => _userCount;

  int get categoryCount => _categoryCount;

  HomePageViewModel(){
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getUserCount();
      getCategoriesCount();
    });
  }

  void getUserCount()async{
    _userCount = await _repository.getUsersCount();
    notifyListeners();
  }

  void goUsersPage({required BuildContext context}){
    MaterialPageRoute pageRoute = MaterialPageRoute(builder: (context) => ChangeNotifierProvider(create: (context) => UsersPageViewModel(),child: const UsersPageView(),),);
    Navigator.push(context, pageRoute);
  }

  void goCategoriesPage({required BuildContext context}){
    MaterialPageRoute pageRoute = MaterialPageRoute(builder: (context) => ChangeNotifierProvider(create: (context) => CategoriesPageViewModel(),child: const CategoriesPageView(),),);
    Navigator.push(context, pageRoute);
  }
  void getCategoriesCount()async{
    _categoryCount = await _repository.getCategoriesCount();
    notifyListeners();
  }
}