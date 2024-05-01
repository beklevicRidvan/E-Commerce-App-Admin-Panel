import 'package:get_it/get_it.dart';

import '../repository/database_repository.dart';
import '../service/cloud_firestore/firebase_firestore_service.dart';

final GetIt locator = GetIt.instance;


setupLocator(){
  locator.registerLazySingleton(() => DatabaseRepository());
  locator.registerLazySingleton(() => FirebaseFirestoreService());

}