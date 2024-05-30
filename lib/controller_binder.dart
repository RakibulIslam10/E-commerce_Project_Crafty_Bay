import 'package:crafty_bay/presentation/state_holder/add_to_cart_controller.dart';
import 'package:crafty_bay/presentation/state_holder/category_list_controller.dart';
import 'package:crafty_bay/presentation/state_holder/home_slider_controller.dart';
import 'package:crafty_bay/presentation/state_holder/main_bottom_nav_screen_controller.dart';
import 'package:crafty_bay/presentation/state_holder/popular_product_list_controller.dart';
import 'package:crafty_bay/presentation/state_holder/product_details_controller.dart';
import 'package:crafty_bay/presentation/state_holder/product_list_by_category_controller.dart';
import 'package:crafty_bay/presentation/state_holder/special_product_list_controller.dart';
import 'package:crafty_bay/presentation/state_holder/verify_email_controller.dart';
import 'package:crafty_bay/presentation/state_holder/verify_otp_controller.dart';
import 'package:get/get.dart';

import 'presentation/state_holder/new_product_list_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(MainBottomNavBarController());
    Get.put(HomeSliderController());
    Get.put(CategoryListController());
    Get.put(ProductListByCategoryController());
    Get.put(PopularProductListController());
    Get.put(NewProductListController());
    Get.put(SpecialProductListController());
    Get.put(ProductDetailsController());
    Get.put(AddToCartController());
    Get.put(VerifyEmailController());
    Get.put(VerifyOtpController());
  }
}
