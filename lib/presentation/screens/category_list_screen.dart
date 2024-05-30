import 'package:crafty_bay/presentation/state_holder/category_list_controller.dart';
import 'package:crafty_bay/presentation/state_holder/main_bottom_nav_screen_controller.dart';
import 'package:crafty_bay/presentation/widgets/category_item.dart';
import 'package:crafty_bay/presentation/widgets/circular_progress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({super.key});

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_) {
        Get.find<MainBottomNavBarController>().backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Category list'),
          leading: IconButton(
            onPressed: () {
              Get.find<MainBottomNavBarController>().backToHome();
            },
            icon: const Icon(Icons.arrow_back_ios_sharp),
          ),
        ),
        body: GetBuilder<CategoryListController>(
            builder: (categoryListController) {
              if (categoryListController.inProgress) {
                return const CenteredCircularProgressIndicator();
              }

              return RefreshIndicator(
                onRefresh: categoryListController.getCategoryList,
                child: GridView.builder(
                  itemCount: categoryListController.categoryList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 0.72,
                  ),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CategoryItem(
                        category: categoryListController.categoryList[index],
                      ),
                    );
                  },
                ),
              );
            }),
      ),
    );
  }
}