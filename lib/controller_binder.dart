import 'package:crafty_bay/presentation/state_holder/home_slider_controller.dart';
import 'package:crafty_bay/presentation/state_holder/main_bottom_nav_screen_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(MainBottomNavBarController());
    Get.put(HomeSliderController());
  }
}
