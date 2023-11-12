import 'package:empire_flutter/model/product_model.dart';
import 'package:empire_flutter/util/dimensions.dart';
import 'package:empire_flutter/util/images.dart';
import 'package:empire_flutter/util/styles.dart';
import 'package:empire_flutter/view/components/contained_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductBottomSheet extends StatelessWidget {
  final Product product;
  const ProductBottomSheet({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimensions.large),
              topRight: Radius.circular(Dimensions.large)),
          color: Colors.white),
      width: 550,
      height: context.height * 0.5,
      padding: const EdgeInsets.all(Dimensions.small),
      child: Column(
        children: [
          Expanded(
            child: Row(children: [
              Image.asset(
                Images.placeholder,
                width: context.width * 0.4,
              ),
              SizedBox(
                width: context.width * 0.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Product Name : ${product.name}",
                      style: robotoRegular.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: Dimensions.small,
                    ),
                    Text(
                      "Product Description:",
                      style: robotoRegular.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: Dimensions.small,
                    ),
                    Text(
                      product.detail!,
                      style: robotoRegular,
                    )
                  ],
                ),
              )
            ]),
          ),
          const SizedBox(
            height: Dimensions.small,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total: ${product.price}",
                style: robotoBold.copyWith(
                    fontSize: Dimensions.defaultSize + 3,
                    fontWeight: FontWeight.bold),
              ),
              CustomContainedButton(
                text: "Add to Cart",
                onPressed: () {},
                width: context.width * 0.5,
              )
            ],
          )
        ],
      ),
    );
  }
}
