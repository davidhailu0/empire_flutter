import 'package:empire_flutter/model/product_model.dart';
import 'package:empire_flutter/util/dimensions.dart';
import 'package:empire_flutter/util/styles.dart';
import 'package:empire_flutter/view/components/item_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();

  static Future<void> loadData(bool reload) async {}
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchTextingController = TextEditingController();
  // List<CategoryModel>? categoryList = [];
  // List<CategoryModel>? subCategoryList = [];

  @override
  void initState() {
    super.initState();

    HomeScreen.loadData(false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawerEnableOpenDragGesture: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {},
          child: SingleChildScrollView(
            child: Center(
              child: Column(children: [
                const SizedBox(
                  height: Dimensions.defaultSize,
                ),
                Container(
                  height: 60,
                  width: context.width * 0.85,
                  padding: const EdgeInsets.symmetric(
                      horizontal: Dimensions.extraSmall),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).primaryColor, width: 1),
                      borderRadius:
                          BorderRadius.circular(Dimensions.defaultSize)),
                  child: Row(
                    children: [
                      const Icon(Icons.search),
                      const SizedBox(
                        width: Dimensions.small,
                      ),
                      Expanded(
                          child: TextField(
                        controller: searchTextingController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search Product",
                          hintStyle: robotoRegular.copyWith(
                              color: context.theme.disabledColor),
                        ),
                      ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: Dimensions.defaultSize,
                ),
                ItemCard(
                    product: Product(
                        name: "Laptop",
                        detail:
                            "A Brand New Laptop with core i9, 32 GB RAM, 8 GB Nvidia Graphics Card",
                        price: 67000)),
                const SizedBox(
                  height: Dimensions.defaultSize,
                ),
                ItemCard(
                    product: Product(
                        name: "Mobile",
                        detail: "A Brand New Mobile 8 GB RAM, 128 GB Storage",
                        price: 15000))
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

class SliverDelegate extends SliverPersistentHeaderDelegate {
  Widget child;
  double height;

  SliverDelegate({required this.child, this.height = 50});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(SliverDelegate oldDelegate) {
    return oldDelegate.maxExtent != height ||
        oldDelegate.minExtent != height ||
        child != oldDelegate.child;
  }
}
