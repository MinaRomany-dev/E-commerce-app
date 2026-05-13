import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce2/features/home/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListViewSearch extends StatelessWidget {
  final List<ProductEntity> products;

  const ListViewSearch({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10.h,
        crossAxisSpacing: 6.w,
        childAspectRatio: .65.sp,
      ),
      itemBuilder: (context, index) {
        final product = products[index];

        return Padding(
          padding: EdgeInsets.all(8.0.sp),
          child: Card(
            color: Colors.white,
            child: Column(
              children: [
                //* Product image
                Container(
                  height: 130.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: product.imageCover,
                    fit: BoxFit.cover,

                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),

                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),

                //* Product info
                Padding(
                  padding: EdgeInsets.all(5.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //* Name
                      Text(
                        product.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      //* Category
                      Text(
                        product.category.name,
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 12.sp,
                        ),
                      ),

                      //* Price
                      Row(
                        children: [
                          Text(
                            "\$${product.priceAfterDiscount}",
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(width: 6.w),

                          Text(
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

                      //* Rating
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 13.sp,
                            color: Colors.orange,
                          ),

                          SizedBox(width: 4.w),

                          Text(
                            "${product.ratingsAverage}",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}