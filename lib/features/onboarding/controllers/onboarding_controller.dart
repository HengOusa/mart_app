
import 'package:get/get.dart';
import 'package:mart_app/core/routes/app_routes.dart';
import 'package:mart_app/features/onboarding/data/onboarding_data.dart';

class OnboardingController extends GetxController {
  final RxInt currentPage = 0.obs;
  //Total Pages
  int get totalPages => OnboardingData.items.length;
  // Update current pages
  bool get isLastPage => currentPage.value == totalPages - 1;

  // Update current page
  void onPageChanged(int index) {
    currentPage.value = index;
  }

  // Next button
  void nextPage() {
    if (isLastPage) {
      goToLogin();
    } else {
      // currentPage.value += 1;
      currentPage.value++;
    }
  }

  void skip() {
    goToLogin();
  }

  void goToLogin() {
    // Change this route to your actual login route.
    Get.offAllNamed(AppRoutes.login);
  }
}
