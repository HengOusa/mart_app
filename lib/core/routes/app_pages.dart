
import 'package:ecommerce_app/features/login/screens/login_screen.dart';
import 'package:ecommerce_app/features/onboarding/screens/onboarding_screen.dart';
import 'package:ecommerce_app/features/sign_up/screens/signup_screen.dart';
import 'package:ecommerce_app/features/splash/screens/splash_screen.dart';
import 'package:get/get.dart';

import 'app_routes.dart';



class AppPages {
  static final List<GetPage> routes = [
    GetPage(
      name: AppRoutes.onboardingScreen,
      page: () => OnboardingScreen(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: AppRoutes.splashScreen,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: AppRoutes.signup,
      page: () => const SignupScreen(),
    ),

  ];
}
