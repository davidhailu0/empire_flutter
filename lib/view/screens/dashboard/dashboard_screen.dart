import 'dart:async';
import 'package:empire_flutter/util/dimensions.dart';
import 'package:empire_flutter/view/components/bottom_navitem.dart';
import 'package:empire_flutter/view/components/cart_button.dart';
import 'package:empire_flutter/view/screens/cart/cart_screen.dart';
import 'package:empire_flutter/view/screens/favourite/favorite_screen.dart';
import 'package:empire_flutter/view/screens/home/home_screen.dart';
import 'package:empire_flutter/view/screens/order/order_screen.dart';
import 'package:empire_flutter/view/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  final int pageIndex;
  final bool fromSplash;
  const DashboardScreen(
      {Key? key, required this.pageIndex, this.fromSplash = false})
      : super(key: key);

  @override
  DashboardScreenState createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen> {
  int _pageIndex = 0;
  late List<Widget> _screens;
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey();
  bool active = false;

  @override
  void initState() {
    super.initState();
    _pageIndex = widget.pageIndex;

    _screens = [
      const HomeScreen(),
      const FavouriteScreen(),
      const CartScreen(fromNav: true),
      const OrderScreen(),
      const ProfileScreen()
    ];

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_pageIndex != 0) {
          _setPage(0);
          return false;
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Back Press again to Exit",
                style: TextStyle(color: Colors.white)),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
            margin: EdgeInsets.all(Dimensions.small),
          ));
          Timer(const Duration(seconds: 2), () {});
          return false;
        }
      },
      child: Scaffold(
          key: _scaffoldKey,
          body: _screens[_pageIndex],
          floatingActionButton: FloatingActionButton(
            elevation: 5,
            backgroundColor: _pageIndex == 2
                ? Theme.of(context).primaryColor
                : Theme.of(context).cardColor,
            onPressed: () {},
            child: CartWidget(
                color: _pageIndex == 2
                    ? Theme.of(context).cardColor
                    : Theme.of(context).disabledColor,
                size: 30),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            elevation: 5,
            notchMargin: 5,
            clipBehavior: Clip.antiAlias,
            shape: const CircularNotchedRectangle(),
            color: Theme.of(context).cardColor,
            child: Row(children: [
              BottomNavItem(
                  iconData: Icons.home,
                  isSelected: _pageIndex == 0,
                  onTap: () => _setPage(0)),
              BottomNavItem(
                  iconData: Icons.favorite,
                  isSelected: _pageIndex == 1,
                  onTap: () => _setPage(1)),
              const Expanded(child: SizedBox()),
              BottomNavItem(
                  iconData: Icons.shopping_bag,
                  isSelected: _pageIndex == 3,
                  onTap: () => _setPage(3)),
              BottomNavItem(
                  iconData: Icons.person,
                  isSelected: _pageIndex == 4,
                  onTap: () => _setPage(4)),
            ]),
          )),
    );
  }

  void _setPage(int pageIndex) {
    setState(() {
      _pageIndex = pageIndex;
    });
  }
}
