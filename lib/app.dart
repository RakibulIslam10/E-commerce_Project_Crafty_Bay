import 'package:crafty_bay/controller_binder.dart';
import 'package:crafty_bay/presentation/screens/splash_screen.dart';
import 'package:crafty_bay/presentation/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CraftyBay extends StatefulWidget {
  const CraftyBay({super.key});

  @override
  State<CraftyBay> createState() => _CraftyBayState();
}

class _CraftyBayState extends State<CraftyBay> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: ControllerBinder(),
      title: "Crafty Bay",
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      theme: ThemeData(
          colorSchemeSeed: AppColors.primaryColor,
          progressIndicatorTheme: const ProgressIndicatorThemeData(
            color: AppColors.primaryColor,
          ),
          textTheme: _textTheme(),
          inputDecorationTheme: _inputDecorationTheme(),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              fixedSize: const Size.fromWidth(double.maxFinite),
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              backgroundColor: AppColors.primaryColor,
              foregroundColor: Colors.white,
            ),
          )),
    );
  }

  TextTheme _textTheme() => const TextTheme(
        titleLarge: TextStyle(
            fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
        titleSmall: TextStyle(fontSize: 16, color: Colors.blueGrey),
      );

  InputDecorationTheme _inputDecorationTheme() => InputDecorationTheme(
        hintStyle: const TextStyle(color: Colors.grey),
        border: _outlineInputBorder,
        focusedBorder: _outlineInputBorder,
        enabledBorder: _outlineInputBorder,
        errorBorder: _outlineInputBorder.copyWith(
            borderSide: const BorderSide(color: Colors.red)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      );

  final OutlineInputBorder _outlineInputBorder = const OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.primaryColor));
}
