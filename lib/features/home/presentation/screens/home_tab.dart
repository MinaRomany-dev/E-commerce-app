import 'package:ecommerce2/features/home/presentation/cubit/product_cubit.dart';
import 'package:ecommerce2/features/home/presentation/listproduct.dart';
import 'package:ecommerce2/features/home/presentation/screens/widgets/horizontal_list.dart';
import 'package:ecommerce2/features/home/presentation/screens/widgets/product_shimmer.dart';
import 'package:ecommerce2/features/home/presentation/screens/widgets/search_side.dart';
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
  String selectedcategory = 'All';

  @override
  void initState() {
    super.initState();
    context.read<ProductCubit>().onScroll();
    print("INIT STATE");
    //  context.read<ProductCubit>().fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            // Search Container
            SearchSide(),

            SizedBox(width: 6.w),
            // filter
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

        //        Category list
        SizedBox(height: 10.h),
        CategoryListView(onTab: onTap),
        SizedBox(height: 10.h),

        //          Grid View
        Expanded(
          child: BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              if (state is Productloading) {
                return ProductGridShimmer();
              } else if (state is ProductError) {
                return Center(child: Text(state.message));
              } else if (state is ProductLoaded) {
                final products = selectedcategory == 'All'
                    ? state.products
                    : state.products.where((product) {
                        return product.category.name.toLowerCase().startsWith(
                          selectedcategory.toLowerCase(),
                        );
                      }).toList();

                return ListViewProduct(
                  controller: context.read<ProductCubit>().scrollController,

                  products: products,
                );
              }
              return SizedBox(
                height: 100.h,
                width: 100.w,
                child: Center(child: Text("No data")),
              );
            },
          ),
        ),
      ],
    );
  }

  void onTap(String selectedCategory) {
    setState(() {
      selectedcategory = selectedCategory;
    });
  }
}
