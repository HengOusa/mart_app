import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/widgets/primary_button.dart';
import 'package:ecommerce_app/features/onboarding/controllers/onboarding_controller.dart';
import 'package:ecommerce_app/features/onboarding/data/onboarding_data.dart';
import 'package:ecommerce_app/features/onboarding/screens/onboarding_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/utils.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final OnboardingController controller = Get.put(OnboardingController());
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  ),
                  onPressed: () {
                    controller.skip();
                  },
                  child: Text("Skip", style: TextStyle(fontSize: 15)),
                ),
              ),

              Expanded(
                child: PageView.builder(
                  controller: pageController,
                  itemCount: controller.totalPages,
                  onPageChanged: controller.onPageChanged,
                  itemBuilder: (context, index) {
                    return OnboardingItem(
                      item: OnboardingData.items[index],
                      imageHeight: size.height * 0.35,
                    );
                  },
                ),
              ),
              // Page Indicator
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(OnboardingData.items.length, (index) {
                    final bool isActive = controller.currentPage.value == index;

                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      height: 8,
                      width: isActive ? 28 : 8,
                      decoration: BoxDecoration(
                        color: isActive
                            ? AppColors.primaryColor
                            : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(height: 30),

              // Next / Get Started Button
              Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: Obx(
                  () => PrimaryButton(
                    title:
                        controller.currentPage.value ==
                            controller.totalPages - 1
                        ? 'Get Started'
                        : 'Next',
                    onPressed: () {
                      if (controller.isLastPage) {
                        controller.nextPage();
                      } else {
                        pageController.nextPage(
                          duration: Duration(milliseconds: 400),
                          curve: Curves.easeOut,
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
