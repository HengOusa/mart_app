
import 'package:flutter/material.dart';
import 'package:mart_app/core/constants/app_colors.dart';
import 'package:mart_app/features/login/home/screen/home_screen.dart';
import 'package:mart_app/features/product/screen/product_detail.dart';
import 'package:mart_app/features/product/screen/product_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  final List<Widget> _pages = const [
    ProductScreen(),
    ProductDetail(),
    HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(elevation: 0),
        ),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          enableFeedback: false,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: AppColors.fontgroundBlack,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}
