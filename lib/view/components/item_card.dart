import 'package:empire_flutter/model/product_model.dart';
import 'package:empire_flutter/util/dimensions.dart';
import 'package:empire_flutter/util/images.dart';
import 'package:empire_flutter/util/styles.dart';
import 'package:empire_flutter/view/components/custom_image.dart';
import 'package:empire_flutter/view/components/product_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ItemCard extends StatelessWidget {
  final Product product;
  const ItemCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.bottomSheet(
          ProductBottomSheet(product: product),
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
        );
      },
      child: Container(
        width: context.width * 0.85,
        height: 170,
        decoration: BoxDecoration(
          color: const Color(0xffE9E9E9),
          borderRadius: BorderRadius.circular(Dimensions.small),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(
            flex: 6,
            child: Stack(
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                      top: Dimensions.extraSmall,
                      left: Dimensions.extraSmall,
                      right: Dimensions.extraSmall),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.small),
                        topRight: Radius.circular(Dimensions.small)),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CustomImage(
                        placeholder: Images.placeholder,
                        image: "",
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: Dimensions.small,
                  right: Dimensions.small,
                  child: InkWell(
                    onTap: () {},
                    child: const SizedBox(),
                  ),
                ),
                Positioned(
                    bottom: Dimensions.small,
                    right: Dimensions.small,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(Dimensions.small),
                      ),
                      child: Row(children: [
                        InkWell(
                          onTap: () {},
                          child: const SizedBox(),
                        ),
                        InkWell(
                          onTap: () {},
                          child: const SizedBox(),
                        ),
                      ]),
                    )),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(Dimensions.extraSmall),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: Dimensions.extraSmall),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(product.name!,
                          style: robotoMedium,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1),
                    ],
                  ),
                  const SizedBox(height: Dimensions.extraSmall),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("4.5",
                          style: robotoRegular.copyWith(
                              fontSize: Dimensions.fontSizeExtraSmall)),
                      const SizedBox(width: Dimensions.extraSmall),
                      Icon(Icons.star,
                          color: Theme.of(context).primaryColor, size: 15),
                      const SizedBox(width: Dimensions.extraSmall),
                      Text('(4.5)',
                          style: robotoRegular.copyWith(
                              fontSize: Dimensions.fontSizeExtraSmall,
                              color: Theme.of(context).disabledColor)),
                    ],
                  ),
                  const SizedBox(height: Dimensions.extraSmall),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(product.price.toString(),
                          style: robotoRegular.copyWith(
                              fontSize: Dimensions.fontSizeExtraSmall,
                              color: Theme.of(context).disabledColor,
                              decoration: TextDecoration.lineThrough))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class ItemCardShimmer extends StatelessWidget {
  final bool? isPopularNearbyItem;
  const ItemCardShimmer({Key? key, this.isPopularNearbyItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: (isPopularNearbyItem!) ? 1 : 5,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: Dimensions.defaultSize),
            child: Shimmer(
              duration: const Duration(seconds: 2),
              enabled: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 240,
                    width: 190,
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(Dimensions.small),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 133,
                          width: 190,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(Dimensions.small),
                                topRight: Radius.circular(Dimensions.small)),
                          ),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(Dimensions.small),
                                topRight: Radius.circular(Dimensions.small)),
                            child: Container(
                              color: Colors.grey[300],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 10,
                                width: 100,
                                color: Colors.grey[300],
                              ),
                              const SizedBox(height: Dimensions.extraSmall),
                              Container(
                                height: 10,
                                width: 150,
                                color: Colors.grey[300],
                              ),
                              const SizedBox(height: Dimensions.extraSmall),
                              Container(
                                height: 10,
                                width: 100,
                                color: Colors.grey[300],
                              ),
                              const SizedBox(height: Dimensions.extraSmall),
                              Container(
                                height: 10,
                                width: 100,
                                color: Colors.grey[300],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
