import 'package:firebase_core/firebase_core.dart';
import 'package:firestore_ecommerce_adminpanel/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'tools/locator.dart';
import 'view/home_page_view.dart';
import 'view_model/home_page_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.dark,
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.red, centerTitle: true)),
      home: ChangeNotifierProvider(
        create: (context) => HomePageViewModel(),
        child: const HomePageView(),
      ),
    );
  }
}
