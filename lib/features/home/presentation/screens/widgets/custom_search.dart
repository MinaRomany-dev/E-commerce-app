import 'package:ecommerce2/core/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce2/features/home/domain/entities/product_entity.dart';
import 'package:ecommerce2/features/home/presentation/screens/widgets/listview_search.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SearchScreen extends SearchDelegate {
  final List<ProductEntity> products;
  SearchScreen({required this.products});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      InkWell(
        onTap: () {
          if (query.isEmpty) return;
          showResults(context);
        },
        child: Text(
          "Search",
          style: getMediumStyle(fontSize: 12.sp, color: Colors.black),
        ),
      ),
      SizedBox(width: 5.w),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back_ios_new),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final filtered = products
        .where(
          (p) =>
              p.title.trim().toLowerCase().contains(
                query.trim().toLowerCase(),
              ) ||
              p.category.name.trim().toLowerCase().contains(
                query.trim().toLowerCase(),
              ),
        )
        .toList();
    if (filtered.isEmpty) {
      return Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search, size: 50.sp, color: Colors.grey),
            SizedBox(height: 12.h),
            Center(
              child: Text(
                "Oops!",
                style: getBoldStyle(color: Colors.black, fontSize: 20.sp),
              ),
            ),
            SizedBox(height: 5.h),
            Center(
              child: Text(
                "  No results found for \"$query\"  ",
                style: TextStyle(
                  color: const Color.fromARGB(255, 65, 64, 64),
                  fontSize: 13.sp,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      color: Colors.white,
      child: ListViewSearch(products: filtered),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final filtered = products
        .where(
          (p) =>
              p.title.trim().toLowerCase().contains(
                query.trim().toLowerCase(),
              ) ||
              p.category.name.trim().toLowerCase().contains(
                query.trim().toLowerCase(),
              ),
        )
        .toList();
    if (filtered.isEmpty) {
      return Container(
        color: Colors.white,
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search, size: 50.sp, color: Colors.grey),
            SizedBox(height: 12.h),
            Center(
              child: Text(
                "Oops!",
                style: getBoldStyle(color: Colors.black, fontSize: 20.sp),
              ),
            ),
            SizedBox(height: 5.h),
            Center(
              child: Text(
                "  No results found for \"$query\"  ",
                style: TextStyle(
                  color: const Color.fromARGB(255, 65, 64, 64),
                  fontSize: 13.sp,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return  Container(
      color: Colors.white,
      child: ListViewSearch(products: filtered),
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      inputDecorationTheme: InputDecorationTheme(
        // filled: true,
        // fillColor: Colors.grey.shade100,
        contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),

        hintStyle: TextStyle(color: Colors.grey, fontSize: 12.sp),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide.none,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide.none,
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: Colors.black12, width: 1),
        ),
      ),
    );
  }
}
