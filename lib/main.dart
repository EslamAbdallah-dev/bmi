import 'package:bmi/home_scr.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.teal,
          canvasColor: Colors.black,
          iconTheme: const IconThemeData(color: Colors.white, size: 90),
          textTheme: const TextTheme(
              headline1: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 45,
                color: Colors.white,
              ),
              headline2: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 30,
                color: Colors.black,
              ))),
      home: const HomeScreen(),
    );
  }
}
