import 'package:empire_flutter/controller/cart_controller.dart';
import 'package:empire_flutter/util/styles.dart';
import 'package:empire_flutter/view/components/appbar.dart';
import 'package:empire_flutter/view/components/contained_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  final bool fromNav;
  const CartScreen({Key? key, required this.fromNav}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: "My Cart"),
        endDrawerEnableOpenDragGesture: false,
        body: GetBuilder<CartController>(
          builder: (cartController) {
            return cartController.cartList.isNotEmpty
                ? Column(
                    children: [
                      Expanded(
                        child: Scrollbar(
                          controller: scrollController,
                          child: SingleChildScrollView(
                            controller: scrollController,
                            child: Center(
                              child: SizedBox(
                                width: context.width,
                                child: Column(
                                  children: [],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      CustomContainedButton(
                          text: "Proceed to Checkout", onPressed: () {})
                    ],
                  )
                : SingleChildScrollView(
                    child: RichText(
                        text: TextSpan(
                            text: "Your Cart List is Empty",
                            style: robotoRegular.copyWith(
                                color: Theme.of(context).disabledColor))));
          },
        ));
  }
}
