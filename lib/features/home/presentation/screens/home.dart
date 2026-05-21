import 'package:ecommerce2/core/resources/styles_manager.dart';
import 'package:ecommerce2/features/cart/presentation/screens/cart_screen.dart';
import 'package:ecommerce2/features/home/presentation/screens/favourite_tab.dart';
import 'package:ecommerce2/features/home/presentation/screens/home_tab.dart';
import 'package:ecommerce2/features/home/presentation/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;

  final List<Widget> tabs = [
    Hometab(),
    CartScreen(),
    FavouriteScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 65.h,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        // appBar
        title: Text(
          "Discover",
          style: getBoldStyle(fontSize: 27.sp, color: Colors.black),
        ),
      ),

      // Body
      body: SafeArea(child: tabs[index]),

      // Bottom Navigation
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
          child: GNav(
            // backgroundColor: const Color.fromARGB(255, 43, 40, 40),
            selectedIndex: index,
            onTabChange: (value) {
              index = value;
              setState(() {});
            },
            tabBorderRadius: 20,
            tabBorder: Border.all(color: Colors.grey.shade200, width: 1),
            tabShadow: [
              BoxShadow(
                color: const Color.fromARGB(
                  255,
                  253,
                  252,
                  252,
                ).withOpacity(0.05),
                blurRadius: 12,
                offset: Offset(0, 4),
              ),
            ],
            curve: Curves.easeInOutCubic,
            duration: Duration(milliseconds: 150),
            gap: 6,
            color: const Color.fromARGB(255, 218, 217, 217),
            activeColor: const Color.fromARGB(255, 0, 0, 0),
            iconSize: 20.sp,
            //   tabBackgroundColor: const Color.fromARGB(255, 11, 0, 0).withOpacity(0.15),
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
            tabs: [
              GButton(icon: Icons.home, text: 'Home'),
              GButton(icon: Icons.shopping_cart_outlined, text: 'Cart'),
              GButton(icon: Icons.favorite, text: 'Saved'),
              GButton(icon: Icons.person, text: 'Account'),
            ],
          ),
        ),
      ),
    );
  }
}
