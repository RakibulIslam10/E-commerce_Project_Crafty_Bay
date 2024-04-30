import 'package:crafty_bay/presentation/screens/home_screen.dart';
import 'package:crafty_bay/presentation/screens/splash_screen.dart';
import 'package:crafty_bay/presentation/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Crafty Bay",
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      theme: ThemeData(
          colorSchemeSeed: AppColors.primaryColor,
          progressIndicatorTheme: const ProgressIndicatorThemeData(
            color: AppColors.primaryColor,
          )),
    );
  }
}
