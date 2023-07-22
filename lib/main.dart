import 'package:flutter/material.dart';
import 'package:myapp/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePag(),
      theme: ThemeData(
        primaryColor: Color(0xffFF3A44),
      ),
    );
  }
}
