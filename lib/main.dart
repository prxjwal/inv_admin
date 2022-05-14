import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:inv_admin/view/mainView.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.blue,
      ),
      home: const MainView(),
    );
  }
}
