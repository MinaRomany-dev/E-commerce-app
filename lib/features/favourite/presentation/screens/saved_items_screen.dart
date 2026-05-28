import 'package:ecommerce2/features/favourite/presentation/cubit/cubit/favourite_cubit.dart';
import 'package:ecommerce2/features/favourite/presentation/screens/widgets/card_item_fav.dart';
import 'package:ecommerce2/features/favourite/presentation/screens/widgets/empty_screen.dart';
import 'package:ecommerce2/features/home/presentation/screens/widgets/product_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductGridScreen extends StatelessWidget {
  const ProductGridScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteCubit, FavouriteState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        if (state is FavouriteLoading) {
          return ProductGridShimmer();
        } else if (state is FavouriteLoaded) {
          if (state.products.isEmpty) {
            return const EmptyFavScreen();
          }
          return GridView.builder(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
            itemCount: state.products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.h,
              crossAxisSpacing: 20.w,
              childAspectRatio: 0.8.sp,
            ),
            itemBuilder: (context, index) {
              final product = state.products[index];
              return ProductCard(
                title: product.title,
                price: product.price.toString(),
                image: product.imageCover,
              );
            },
          );
        } else if (state is FavouriteError) {
          return Center(child: Text(state.message));
        } else {
          return ProductGridShimmer();
        }
      },
    );
  }
}
