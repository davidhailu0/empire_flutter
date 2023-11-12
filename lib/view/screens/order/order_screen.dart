import 'package:empire_flutter/controller/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Order"),
          centerTitle: true,
          bottom: const TabBar(tabs: [
            Tab(
              text: "Current Order",
            ),
            Tab(
              text: "History",
            )
          ]),
          automaticallyImplyLeading: false,
        ),
        body: TabBarView(children: [
          GetBuilder<OrderController>(
            builder: (orderController) {
              return Text("Current Order");
            },
          ),
          GetBuilder<OrderController>(
            builder: (orderController) {
              return Text("History");
            },
          )
        ]),
      ),
    );
  }
}
