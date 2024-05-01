import '../model/category_model.dart';
import '../model/product_model.dart';
import '../model/user_model.dart';

abstract class DatabaseBase{
  Future<dynamic> getCategoriesData();
  Future<dynamic> getCategoriesCount();
  Future<dynamic> addCategories({required CategoryModel categoryModel});
  Future<dynamic> updateCategories({required CategoryModel categoryModel,required String newCategoryName,required String newCategoryImage});
  Future<dynamic> deleteCategories({required CategoryModel categoryModel});

  Future<dynamic> getProductData({required dynamic categoryId});
  Future<dynamic> addProduct({required ProductModel productModel,required dynamic categoryId});
  Future<dynamic> updateProduct({required ProductModel productModel,required dynamic categoryId,required String newProductName,required String newProductImage,required dynamic newProductPrice});
  Future<dynamic> deleteProduct({required ProductModel productModel,required dynamic categoryId});

  Future<dynamic> getUsersData();
  Future<dynamic> getUsersCount();
  Future<dynamic> addUser({required UserModel userModel});
  Future<dynamic> updateUser({required UserModel userModel,required String newUserName,required String newUserEmail});
  Future<dynamic> deleteUser({required UserModel userModel});

}