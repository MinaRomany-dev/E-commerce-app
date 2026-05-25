import 'package:ecommerce2/core/resources/styles_manager.dart';
import 'package:ecommerce2/core/utils/toast.dart';
import 'package:ecommerce2/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:ecommerce2/features/home/domain/entities/product_entity.dart';
import 'package:ecommerce2/features/product_deatils/presentation/widgets/image_product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toastification/toastification.dart';

class DetailsProduct extends StatelessWidget {
  const DetailsProduct({super.key});

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as ProductEntity;
    final cleanDescription = product.description
        .replaceAll(r'\n', '\n')
        .replaceAll(r'\t', '   ');

    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartAddedSuccess) {
          AppToast.showToast(
            context: context,
            title: "Product added successfully",
            description: "",
            type: ToastificationType.success,
          );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,

          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),

          title: Text(
            "Details",
            style: getBoldStyle(fontSize: 22.sp, color: Colors.black),
          ),
        ),

        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// PRODUCT IMAGES
                ImageProductDetails(product: product),
                SizedBox(height: 20.h),

                /// TITLE
                Text(
                  product.title,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,

                  style: getBoldStyle(fontSize: 24.sp, color: Colors.black),
                ),

                SizedBox(height: 12.h),

                /// RATING
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 22.sp),
                    SizedBox(width: 6.w),
                    Text(
                      "${product.ratingsAverage}/5",

                      style: getSemiBoldStyle(
                        fontSize: 16.sp,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 18.h),

                /// DESCRIPTION
                Text(
                  cleanDescription,

                  style: getRegularStyle(
                    fontSize: 15.sp,
                    color: const Color.fromARGB(255, 106, 105, 105),
                  ),
                ),
                SizedBox(height: 28.h),

                /// PRICE + BUTTON
                Row(
                  children: [
                    /// PRICE
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Price",

                          style: getRegularStyle(
                            fontSize: 15.sp,
                            color: const Color.fromARGB(255, 118, 117, 117),
                          ),
                        ),

                        SizedBox(height: 4.h),

                        Text(
                          "\$${product.price}",

                          style: getBoldStyle(
                            fontSize: 24.sp,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 20.w),

                    /// BUTTON
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          await context.read<CartCubit>().addToCart(product.id);
                        },
                        borderRadius: BorderRadius.circular(12.r),
                        child: Container(
                          height: 55.h,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Center(
                            child: Text(
                              "Add to Cart",
                              style: getMediumStyle(
                                fontSize: 16.sp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 30.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
