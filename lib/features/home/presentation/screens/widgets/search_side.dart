import 'package:ecommerce2/core/resources/styles_manager.dart';
import 'package:ecommerce2/features/home/presentation/cubit/product_cubit.dart';
import 'package:ecommerce2/features/home/presentation/screens/widgets/custom_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchSide extends StatelessWidget {
  const SearchSide({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                  const Icon(Icons.search, color: Colors.grey),
                  SizedBox(width: 10.w),
                  Text(
                    textAlign: TextAlign.left,
                    "Search",
                    style: getRegularStyle(color: Colors.grey, fontSize: 14.sp),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
