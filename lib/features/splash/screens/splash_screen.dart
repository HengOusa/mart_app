
import 'package:flutter/material.dart';
import 'package:mart_app/core/constants/app_colors.dart';
import 'package:mart_app/core/constants/app_images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: Center(
        child: Image.asset(AppImages.logo),
      ),
    );
  }
}