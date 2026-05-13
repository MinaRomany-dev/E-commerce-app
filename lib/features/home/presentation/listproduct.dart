import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce2/features/home/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// class ListViewProduct extends StatelessWidget {
//   const ListViewProduct({super.key});

//    @override

//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => servicelocator.get<ProductCubit>(),
//       child: BlocBuilder(
//         builder: (context, state) {
//           if (state is ProductLoaded) {
//             return  GridView.builder(
//           physics: BouncingScrollPhysics(),
//           padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
//           itemCount: state.products.length,
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             mainAxisSpacing: 10.h,
//             crossAxisSpacing: 6.w,
//             childAspectRatio: .65.sp,
//           ),
//           itemBuilder: (context, index) {
//             final product = state.products[index];

//             return Container(
//               height: double.infinity,
//               decoration: BoxDecoration(
//                 color: const Color.fromARGB(255, 255, 255, 255),
//                 borderRadius: BorderRadius.circular(16.r),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withValues(alpha: 0.1),
//                     blurRadius: 6,
//                     spreadRadius: 2,
//                   ),
//                 ],
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   //  Image + fav
//                   Stack(
//                     children: [
//                       ClipRRect(
//                         borderRadius: BorderRadius.vertical(
//                           top: Radius.circular(16.r),
//                         ),
//                         child: Image.network(
//                           product.imageCover,
//                           height: 120.h,
//                           width: double.infinity,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       // Positioned(
//                       //   bottom: 8.h,
//                       //   right: 8.w,
//                       //   child: Icon(
//                       //     product.isFavourite=
//                       //         ? Icons.favorite
//                       //         : Icons.favorite_border,
//                       //     color: Colors.black,
//                       //   ),
//                       // ),
//                     ],
//                   ),

//                   Padding(
//                     padding: EdgeInsets.all(5.sp),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // Name
//                         Text(
//                           product.title,
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                           style: const TextStyle(fontWeight: FontWeight.bold),
//                         ),

//                         //   SizedBox(height: 4.h),

//                         // Category
//                         Text(
//                           product.category.name,
//                           style: TextStyle(
//                             color: Colors.grey[500],
//                             fontSize: 12.sp,
//                           ),
//                         ),

//                         //   SizedBox(height: 6.h),

//                         // Price
//                         Row(
//                           children: [
//                             Text(
//                               "\$${product.priceAfterDiscount}",
//                               style: const TextStyle(
//                                 color: Colors.green,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             SizedBox(width: 6.w),

//                               Text(
//                                 "\$${product.price}",
//                                 style: TextStyle(
//                                   decoration: TextDecoration.lineThrough,
//                                   fontSize: 12.sp,
//                                   color: Colors.grey,
//                                 ),
//                               ),
//                           ],
//                         ),

//                         // SizedBox(height: 6.h),

//                         // Rate
//                         Row(
//                           children: [
//                             Icon(Icons.star, size: 14.sp, color: Colors.orange),
//                             SizedBox(width: 4.w),
//                             Text("${product.ratingsAverage}"),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),

//            );

//             ),
//           }

//            else {
//             if (state is ProductError) {
//               return Center(child: Text(state.message));
//             } else {
//               return const Center(child: CircularProgressIndicator());
//             }

//           };
//         )
//       );

//   }
// }

class ListViewProduct extends StatefulWidget {
  final List<ProductEntity> products;
  const ListViewProduct({super.key, required this.products});

  @override
  State<ListViewProduct> createState() => _ListViewProductState();
}

class _ListViewProductState extends State<ListViewProduct> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
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
