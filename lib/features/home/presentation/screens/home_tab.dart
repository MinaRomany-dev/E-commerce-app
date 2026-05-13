import 'package:ecommerce2/core/resources/styles_manager.dart';
import 'package:ecommerce2/features/home/presentation/cubit/product_cubit.dart';
import 'package:ecommerce2/features/home/presentation/listproduct.dart';
import 'package:ecommerce2/features/home/presentation/screens/custom_search.dart';
import 'package:ecommerce2/features/home/presentation/screens/widgets/horizontal_list.dart';
import 'package:ecommerce2/features/home/presentation/screens/widgets/product_shimmer.dart';
import 'package:ecommerce2/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Hometab extends StatefulWidget {
  const Hometab({super.key});

  @override
  State<Hometab> createState() => _HometabState();
}

class _HometabState extends State<Hometab> {
  int selectedcategory = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            //* Search Container
            Expanded(
              child: InkWell(
                onTap: () {
                  final state = context.read<ProductCubit>().state;

                  if (state is ProductLoaded) {
                    showSearch(
                      context: context,
                      delegate: SearchScreen(products: state.products),
                    );
                  }
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
                  height: 42.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                  child: Align(
                    alignment: AlignmentGeometry.centerStart,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      child: Row(
                        children: [
                          Icon(Icons.search, color: Colors.grey),
                          SizedBox(width: 10.w),
                          Text(
                            textAlign: TextAlign.left,
                            "Search",
                            style: getRegularStyle(
                              color: Colors.grey,
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 6.w),
            //* filter
            Container(
              margin: EdgeInsets.only(right: 10.w),
              child: SvgPicture.asset(
                fit: BoxFit.cover,
                width: 42.w,
                height: 40.h,
                Assets.svg.filter,
              ),
            ),
          ],
        ),
        // *Category list
        SizedBox(height: 10.h),
        CategoryListView(onTab: onTap),
        SizedBox(height: 10.h),
        //* Grid View
        Expanded(
          child: BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              if (state is Productloading) {
                return ProductGridShimmer();
              } else if (state is ProductError) {
                return Center(child: Text(state.message));
              } else if (state is ProductLoaded) {
                return ListViewProduct(products: state.products);
              }
              return SizedBox(
                height: 100.h,
                width: 100.w,
                child: Text("No data"),
              );
            },
          ),
        ),
      ],
    );
  }

  void onTap(int selectedIndex) {
    selectedcategory = selectedIndex;
    print('*************************$selectedcategory************************');
  }
}
