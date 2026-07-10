import 'package:flutter/material.dart';
import 'package:syrian_cart/feature/cart/presentation/screens/cart_screen.dart';
import 'package:syrian_cart/feature/fav/presentation/screens/fav_screen.dart';
import 'package:syrian_cart/feature/home/presentation/screens/home_screen.dart';
import 'package:syrian_cart/feature/layout/presentation/widgets/bottomnav/custom_bottom_bar.dart';
import 'package:syrian_cart/feature/profile/presentation/screens/profile_screen.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int currentIndex = 0;

  final pages = const [
    HomeScreen(),
    FavScreen(),
    CartScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: pages[currentIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
