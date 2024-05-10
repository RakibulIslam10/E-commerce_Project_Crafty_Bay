import 'package:crafty_bay/presentation/state_holder/main_bottom_nav_screen_controller.dart';
import 'package:crafty_bay/presentation/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

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
      onPopInvoked: (didPop) {
        Get.find<MainBottomNavBarController>().backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
            leading: IconButton(onPressed: (){
              Get.find<MainBottomNavBarController>().backToHome();
            }, icon: const Icon(Icons.arrow_back_ios)),
          title: const Text("Category List"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: GridView.builder(
            itemCount: 15,
            gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, childAspectRatio: 1.1),
            itemBuilder: (context, index) {
              return const Padding(
                  padding: EdgeInsets.all(8),
                  child: FittedBox(child: CategoryItem()));
            },
          ),
        ),
      ),
    );
  }
}
