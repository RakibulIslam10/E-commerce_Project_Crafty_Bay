import 'package:crafty_bay/presentation/state_holder/home_slider_controller.dart';
import 'package:crafty_bay/presentation/utils/assets_path.dart';
import 'package:crafty_bay/presentation/widgets/app_bar_icon_button.dart';
import 'package:crafty_bay/presentation/widgets/category_item.dart';
import 'package:crafty_bay/presentation/widgets/circular_progress.dart';
import 'package:crafty_bay/presentation/widgets/home_carousel_slider.dart';
import 'package:crafty_bay/presentation/widgets/product_card.dart';
import 'package:crafty_bay/presentation/widgets/section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildSearchTextField(),
              const SizedBox(height: 16),
              GetBuilder<HomeSliderController>(builder: (sliderController) {
                if (sliderController.inProgress) {
                  return const SizedBox(
                      height: 200, child: CircularProgress());
                }
                return HomeCarouselSlider(
                  sliderList: sliderController.sliderList,
                );
              }),
              const SizedBox(height: 16),
              SectionHeader(
                title: "All Category",
                onTapSeeAll: () {},
              ),
              const SizedBox(height: 10),
              _buildCategoryListView(),
              const SizedBox(height: 6),
              SectionHeader(
                title: "Popular",
                onTapSeeAll: () {},
              ),
              const SizedBox(height: 10),
              _buildProductListView(),
              SectionHeader(
                title: "Special",
                onTapSeeAll: () {},
              ),
              const SizedBox(height: 10),
              _buildProductListView(),
              SectionHeader(
                title: "New",
                onTapSeeAll: () {},
              ),
              const SizedBox(height: 10),
              _buildProductListView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryListView() {
    return SizedBox(
      height: 120,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return const CategoryItem();
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 16,
            );
          },
          itemCount: 8),
    );
  }

  Widget _buildProductListView() {
    return SizedBox(
      height: 215,
      child: Expanded(
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return const ProductCard();
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 8,
              );
            },
            itemCount: 8),
      ),
    );
  }

  Widget _buildSearchTextField() {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search",
        prefixIcon: const Icon(Icons.search),
        filled: true,
        fillColor: Colors.grey.shade200,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssetsPath.appLogoNavSvg),
      actions: [
        AppBarIconButton(
          icon: Icons.person,
          onTap: () {},
        ),
        const SizedBox(width: 8),
        AppBarIconButton(
          icon: Icons.call,
          onTap: () {},
        ),
        const SizedBox(width: 8),
        AppBarIconButton(
          icon: Icons.notifications_active_outlined,
          onTap: () {},
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}
