
import 'package:flutter/material.dart';
import 'package:mart_app/constants/color.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: EColor.primary,
      child: Center(
        child: Text(
          'Hello, World!',
          style: TextStyle(color: EColor.secondary),
        ),
      ),
    );
  }
}