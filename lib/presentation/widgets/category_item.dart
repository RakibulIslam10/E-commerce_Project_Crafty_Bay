import 'package:crafty_bay/presentation/screens/product_list_screen.dart';
import 'package:crafty_bay/presentation/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductListScreen(categoryName: "Electronics"));
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: AppColors.primaryColor.withOpacity(0.1),
            ),
            child: const Icon(
              Icons.desktop_windows_outlined,
              size: 50,
              color: AppColors.primaryColor,
            ),
          ),
          const Text(
            "Electronics",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: AppColors.primaryColor),
          )
        ],
      ),
    );
  }
}
