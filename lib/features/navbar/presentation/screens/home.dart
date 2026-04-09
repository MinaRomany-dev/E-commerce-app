import 'package:ecommerce2/features/navbar/presentation/cubit/cubit/navbar_cubit.dart';
import 'package:ecommerce2/features/navbar/presentation/cubit/cubit/navbar_state.dart';
import 'package:ecommerce2/features/navbar/presentation/screens/favourite.dart';
import 'package:ecommerce2/features/navbar/presentation/screens/homescreen.dart';
import 'package:ecommerce2/features/navbar/presentation/screens/profile.dart';
import 'package:ecommerce2/features/navbar/presentation/screens/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Home extends StatelessWidget {
  // int currentindex = 0;
  final List<Widget> tabs = [
    HomeScreen(),
    FavouriteScreen(),
    SearchScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NavbarCubit(),
      child: BlocBuilder<NavbarCubit, NavbarState>(
        builder: (context, state) {
          if (state is Changebody) {
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,
                actions: [SizedBox(width: 60, child: Icon(Icons.search))],
                title: Text(
                  "Discover",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                ),
              ),

              // Body
              body: SafeArea(child: tabs[state.screennum]),

              // Bottom Navigation
              bottomNavigationBar: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                child: GNav(
               //    backgroundColor: const Color.fromARGB(255, 186, 184, 184),
                  selectedIndex: state.screennum,
                  onTabChange: (value) {
                    context.read<NavbarCubit>().swapbody(value);
                  },
                  tabBorderRadius: 20,
                  tabBorder: Border.all(color: Colors.grey.shade200, width: 1),
                  tabShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 253, 252, 252).withOpacity(0.05),
                      blurRadius: 12,
                      offset: Offset(0, 4),
                    ),
                  ],
                  curve: Curves.easeInOutCubic,
                  duration: Duration(milliseconds: 150),
                  gap: 6,
                  color: Colors.grey,
                  activeColor: const Color.fromARGB(255, 0, 0, 0),
                  iconSize: 26,
                //    tabBackgroundColor: const Color.fromARGB(255, 11, 0, 0).withOpacity(0.15),
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  tabs: [
                    GButton(icon: Icons.home, text: 'Home'),
                    GButton(icon: Icons.shopping_cart_outlined, text: 'Cart'),
                    GButton(icon: Icons.favorite, text: 'Saved'),
                    GButton(icon: Icons.person, text: 'Account'),
                  ],
                ),
              ),
            );
          }
          return tabs[0];
        },
      ),
    );
  }
}
