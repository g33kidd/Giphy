import 'package:flutter/material.dart';
import 'package:giphy/pages/home.dart';

void main() => runApp(Giphy());

class Giphy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      title: 'Giphy',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
      ),
    );
  }
}
