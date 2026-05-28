import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryListView extends StatefulWidget {
  final void Function(String name) onTab;

  const CategoryListView({super.key, required this.onTab});

  @override
  State<CategoryListView> createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView> {
  int toggle = 0;
  @override
  Widget build(BuildContext context) {
    final List<String> categories = [
      "All",
      "Women's Fashion",
      "Electronics",
      "Men's Fashion",
    ];
    return SizedBox(
      height: 38.h,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => SizedBox(width: 7.w),
        itemBuilder: (context, index) {
          return InkWell(
            borderRadius: BorderRadius.circular(30.r),
            onTap: () {
              widget.onTab(categories[index]);
              toggle = index;
              setState(() {});
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 4.h),

              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 13, 13, 13),
                ),
                color: index == toggle ? Colors.black : Colors.white,
                borderRadius: BorderRadius.circular(30.r),
              ),

              child: Center(
                child: Text(
                  categories[index],
                  style: TextStyle(
                    color: index == toggle ? Colors.white : Colors.black,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
