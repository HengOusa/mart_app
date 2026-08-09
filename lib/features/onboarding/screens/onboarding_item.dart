
import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/features/onboarding/models/onboarding_model.dart';
import 'package:flutter/material.dart';

class OnboardingItem extends StatelessWidget {
  final OnboardingModel item;
  final double imageHeight;
  const OnboardingItem({
    super.key,
    required this.item,
    required this.imageHeight,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            item.image,
            width: size.width * 0.75,
            height: size.height * 0.35,
            fit: BoxFit.contain,
          ),
          Text(
            item.title,
            style: TextStyle(
              fontSize: 30,
              fontFamily: "Poppins",
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Text(
            item.description,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
