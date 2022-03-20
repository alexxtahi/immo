import 'package:flutter/material.dart';
import 'package:immo/views/screens/home/HomeView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        backgroundColor: Color.fromRGBO(200, 200, 200, 1),
        primaryColor: Colors.white,
        accentColor: Color.fromRGBO(150, 150, 150, 1),
        shadowColor: Color.fromRGBO(0, 0, 0, 0.5),
        hintColor: Colors.black,
      ),
      home: HomeView(),
    );
  }
}
