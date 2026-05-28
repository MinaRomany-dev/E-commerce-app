import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce2/core/routes/routes.dart';
import 'package:ecommerce2/core/utils/toast.dart';
import 'package:ecommerce2/features/favourite/presentation/cubit/cubit/favourite_cubit.dart';
import 'package:ecommerce2/features/home/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toastification/toastification.dart';

class ListViewProduct extends StatefulWidget {
  final List<ProductEntity> products;
  final ScrollController controller;

  const ListViewProduct({
    super.key,
    required this.products,
    required this.controller,
  });

  @override
  State<ListViewProduct> createState() => _ListViewProductState();
}

class _ListViewProductState extends State<ListViewProduct> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<FavouriteCubit, FavouriteState>(
      listener: (context, state) {
        if (state is FavouriteAdded) {
          AppToast.showToast(
            context: context,
            title: "Success",
            description: "Product added to favourite ❤️",
            type: ToastificationType.info,
          );
        }
      },
      child: GridView.builder(
        controller: widget.controller,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
        itemCount: widget.products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 6.h,
          //  crossAxisSpacing: 2.w,
          childAspectRatio: .65.sp,
        ),
        itemBuilder: (context, index) {
          final product = widget.products[index];
          return Padding(
            padding: EdgeInsets.all(8.0.sp),
            child: InkWell(
              onTap: () => Navigator.of(
                context,
              ).pushNamed(Routes.details, arguments: product),
              child: Stack(
                children: [
                  Card(
                    color: Colors.white,
                    child: Column(
                      children: [
                        // Product image
                        Container(
                          height: 130.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            //   color: Colors.white,
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: product.imageCover,

                            fit: BoxFit.cover,

                            placeholder: (context, url) =>
                                Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) {
                              return Container(
                                color: Colors.grey.shade200,
                                child: const Icon(
                                  Icons.broken_image,
                                  color: Colors.grey,
                                  size: 40,
                                ),
                              );
                            },
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.all(5.sp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Name
                              Text(
                                product.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              // Category
                              Text(
                                product.category.name,
                                maxLines: 1,
                                style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: 12.sp,
                                ),
                              ),

                              // Price
                              Row(
                                children: [
                                  product.priceAfterDiscount == null
                                      ? Text(
                                          "\$${product.price}",
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      : Text(
                                          "\$${product.priceAfterDiscount}",
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                  SizedBox(width: 6.w),
                                  product.priceAfterDiscount == null
                                      ? Text("")
                                      : Text(
                                          "\$${product.price}",
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.lineThrough,
                                            fontSize: 11.sp,
                                            color: Colors.grey,
                                          ),
                                        ),
                                ],
                              ),

                              // Rate
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 13.sp,
                                    color: Colors.orange,
                                  ),
                                  SizedBox(width: 4.w),
                                  Text("${product.ratingsAverage}"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Favorite
                  Positioned(
                    right: 8,
                    top: 10,
                    child: Material(
                      color: Colors.white,
                      shape: CircleBorder(),
                      elevation: 2,
                      child: InkWell(
                        onTap: () {
                          context.read<FavouriteCubit>().addToFavourite(
                            product.id,
                          );
                          print("*********************${product.id}");
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 6.w,
                            vertical: 6.h,
                          ),
                          child: Icon(
                            Icons.favorite_border_rounded,
                            size: 20.sp,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
