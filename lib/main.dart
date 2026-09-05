
import 'package:flutter/material.dart';
import 'package:mart_app/features/product/screen/product_detail.dart';
import 'package:mart_app/features/widgets/bottomNavigationBar/bottom_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  // @override
  // Widget build(BuildContext context) {
  //   return GetMaterialApp(
  //     title: 'Flutter Demo',
  //     theme: ThemeData(
  //       colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  //     ),
  //     debugShowCheckedModeBanner: false,
  //     initialRoute: AppRoutes.onboardingScreen,
  //     getPages: AppPages.routes,
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const BottomNavBar(),
        '/productDetail': (context) => const ProductDetail(),
      },
    );
  }
}
