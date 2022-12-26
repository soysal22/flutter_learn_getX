import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:weight_tracer_learn_getx/core/constants/constants.dart';
import 'package:weight_tracer_learn_getx/view/screens/home.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weight Tracer Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            centerTitle: true,
            backgroundColor: Constants.colorBlack,
            titleTextStyle: TextStyle(
              color: Constants.colorWhite,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            )),
        primarySwatch: Colors.orange,
      ),
      // ignore: prefer_const_constructors
      home: Home(),
    );
  }
}
