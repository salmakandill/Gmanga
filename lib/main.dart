import 'package:flutter/material.dart';
import 'package:gmanga/pages/home_screen.dart';

void main() {
  runApp(const Gmanga());
}

class Gmanga extends StatelessWidget {
  const Gmanga({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen());
  }
}
