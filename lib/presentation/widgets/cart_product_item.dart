import 'package:crafty_bay/presentation/utils/app_colors.dart';
import 'package:crafty_bay/presentation/utils/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

class CartProductItem extends StatefulWidget {
  const CartProductItem({super.key});

  @override
  State<CartProductItem> createState() => _CartProductItemState();
}

class _CartProductItemState extends State<CartProductItem> {
  int _counterValue = 1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4.0),
        child: Card(
          surfaceTintColor: Colors.white,
          elevation: 4,
          child: Row(
            children: [
              buildProductImage(),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                  child: Column(
                    children: [
                      buildProductDetail(),
                      buildProductColorAndSize(),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "\$100 ",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: AppColors.primaryColor),
                          ),
                          _buildCounter()
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProductColorAndSize() {
    return const Row(
      children: [
        Text(
          "Color : Red, ",
          style: TextStyle(color: Colors.black54),
        ),
        Text(
          "Size : XL",
          style: TextStyle(color: Colors.black54),
        ),
      ],
    );
  }

  Widget buildProductDetail() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "New Year Special",
          maxLines: 1,
          style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              overflow: TextOverflow.ellipsis),
        ),
        Icon(Icons.delete_outline_sharp)
      ],
    );
  }

  Widget buildProductImage() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(
        AssetsPath.productDummyImgPng,
        width: 120,
      ),
    );
  }

  Widget _buildCounter() {
    return ItemCount(
      initialValue: _counterValue,
      minValue: 1,
      maxValue: 20,
      decimalPlaces: 0,
      color: AppColors.primaryColor,
      onChanged: (value) {
        print(value);
        _counterValue = value as int;
        setState(() {});
      },
    );
  }
}
