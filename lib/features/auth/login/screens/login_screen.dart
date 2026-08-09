import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            width: double.infinity,
            height: 200,
            color: Colors.amber,
          ),
        ),
      ),
    );
  }
}
