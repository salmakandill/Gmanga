import 'package:flutter/material.dart';

import 'package:gmanga/widgets/colors.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colorPrimary,
        borderRadius: BorderRadius.circular(16),
      ),
      width: double.infinity,
      height: 60,
      child: Center(
        child: Text(
          'Login',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
