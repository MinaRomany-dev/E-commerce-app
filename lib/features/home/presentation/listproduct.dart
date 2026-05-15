import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce2/features/home/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ListViewProduct extends StatefulWidget {
  final List<ProductEntity> products;
  final ScrollController controller;
  const ListViewProduct({super.key, required this.products ,required this.controller});

  @override
  State<ListViewProduct> createState() => _ListViewProductState();
}

class _ListViewProductState extends State<ListViewProduct> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: widget.controller,
      shrinkWrap: true,
      physics:const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 30.h),
      itemCount: widget.products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10.h,
        crossAxisSpacing: 6.w,
        childAspectRatio: .65.sp,
      ),
      itemBuilder: (context, index) {
        final product = widget.products[index];
        return Padding(
          padding: EdgeInsets.all(8.0.sp),
          child: Card(
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
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    imageUrl: product.imageCover,

                    fit: BoxFit.cover,
                  ),
                ),

                // Product info
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
                        style: const TextStyle(fontWeight: FontWeight.bold),
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
                              decoration: TextDecoration.lineThrough,
                              fontSize: 11.sp,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),

                      // Rate
                      Row(
                        children: [
                          Icon(Icons.star, size: 13.sp, color: Colors.orange),
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
        );
      },
    );
  }
}
