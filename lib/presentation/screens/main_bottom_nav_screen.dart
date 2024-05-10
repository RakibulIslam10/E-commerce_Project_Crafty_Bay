import 'package:crafty_bay/presentation/screens/cart_list_screen.dart';
import 'package:crafty_bay/presentation/screens/category_list_screen.dart';
import 'package:crafty_bay/presentation/screens/home_screen.dart';
import 'package:crafty_bay/presentation/screens/wish_list_screen.dart';
import 'package:crafty_bay/presentation/state_holder/main_bottom_nav_screen_controller.dart';
import 'package:crafty_bay/presentation/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  final MainBottomNavBarController _navBarController =
      Get.find<MainBottomNavBarController>();

  List<Widget> Screens = [
    const HomeScreen(),
    const CategoryListScreen(),
    const CartListScreen(),
    const WishListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MainBottomNavBarController>(
        builder: (_) {
          return Screens[_navBarController.selectedIndex];
        },
      ),
      bottomNavigationBar: GetBuilder<MainBottomNavBarController>(builder: (_) {
        return BottomNavigationBar(
            currentIndex: _navBarController.selectedIndex,
            onTap: _navBarController.changeIndex,
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.dashboard_outlined), label: "Categories"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart), label: "Cart"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_border), label: "WishList"),
            ]);
      }),
    );
  }
}
