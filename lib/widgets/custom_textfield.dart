// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({super.key, this.hintText,this.obscure = false});
  
String? hintText;
final bool obscure;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscure, 
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
      ),
    );
  }
}