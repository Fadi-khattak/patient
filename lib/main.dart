import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:patient/Views/Drawer/chatScreen.dart';
import 'package:patient/Views/MyAppointments.dart';
import 'package:patient/Views/RequestSent.dart';
import 'package:patient/Views/SplashScreen.dart';

import 'Views/Login.dart';
 const _lightGreen = Color(0xffCDE0C9);
void main()async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent
  ));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black
          )
        ), fontFamily: 'Mont'),
      home:SplashScreen(),
      );
  }
}
