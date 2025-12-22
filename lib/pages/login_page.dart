import 'package:flutter/material.dart';
import 'package:gmanga/pages/home_screen.dart';
import 'package:gmanga/widgets/colors.dart';
import 'package:gmanga/widgets/custom_button.dart';
import 'package:gmanga/widgets/custom_textfield.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 80),
              Image.asset('images/logo.jpg', height: 200, width: 200),
              Text(
                'Welcome to Gmanga',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Times New Roman',
                  color: colorPrimary,
                ),
              ),
              SizedBox(height: 40),
              Row(
                children: [
                  Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Times New Roman',
                      color: colorPrimary,
                    ),
                  ),
                ],
              ),

              CustomTextField(hintText: 'Enter your username'),
              SizedBox(height: 20),
              CustomTextField(hintText: 'Enter your password', obscure: true),
              SizedBox(height: 20),
              CustomButton(),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account?',
                    style: TextStyle(fontSize: 18),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return HomeScreen() ;
                          },
                        ),
                      );
                    },
                    child: Text(
                      ' Register',
                      style: TextStyle(
                        color: colorPrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
