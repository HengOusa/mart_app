import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/constants/app_images.dart';
import 'package:flutter/material.dart';

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