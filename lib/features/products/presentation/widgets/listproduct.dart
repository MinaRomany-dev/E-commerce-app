import 'package:ecommerce2/features/products/data/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class ListViewProduct extends StatelessWidget {
  List<Product> products = [
    Product(
      name: "Nike Shoes",
      description: "Running shoes",
      price: 120,
      oldPrice: 150,
      isFavourite: true,
      isOnSale: true,
      imageUrl: "https://i.imgur.com/CGCyp1d.png",
      rate: 4.5,
      comments: 120,
      category: "Shoes",
    ),
    Product(
      name: "Smart Watch",
      description: "Fitness tracker",
      price: 80,
      oldPrice: 100,
      isFavourite: false,
      isOnSale: true,
      imageUrl: "https://i.imgur.com/sJ3CT4V.gif",
      rate: 4.2,
      comments: 80,
      category: "Electronics",
    ),
    Product(
      name: "Smart Watch",
      description: "Fitness tracker",
      price: 80,
      oldPrice: 100,
      isFavourite: false,
      isOnSale: true,
      imageUrl: "https://i.imgur.com/sJ3CT4V.gif",
      rate: 4.2,
      comments: 80,
      category: "Electronics",
    ),
    Product(
      name: "Smart Watch",
      description: "Fitness tracker",
      price: 80,
      oldPrice: 100,
      isFavourite: false,
      isOnSale: true,
      imageUrl: "https://i.imgur.com/sJ3CT4V.gif",
      rate: 4.2,
      comments: 80,
      category: "Electronics",
    ),
    Product(
      name: "Smart Watch",
      description: "Fitness tracker",
      price: 80,
      oldPrice: 100,
      isFavourite: false,
      isOnSale: true,
      imageUrl: "https://i.imgur.com/sJ3CT4V.gif",
      rate: 4.2,
      comments: 80,
      category: "Electronics",
    ),
    Product(
      name: "Nike Shoes",
      description: "Running shoes",
      price: 120,
      oldPrice: 150,
      isFavourite: true,
      isOnSale: true,
      imageUrl: "https://i.imgur.com/CGCyp1d.png",
      rate: 4.5,
      comments: 120,
      category: "Shoes",
    ),
  ];

  ListViewProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12.h,
        crossAxisSpacing: 12.w,
        childAspectRatio: .76.sp,
      ),
      itemBuilder: (context, index) {
        final product = products[index];

        return Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(alpha: 0.1),
                blurRadius: 6,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //  Image + fav
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16.r),
                    ),
                    child: Image.network(
                      product.imageUrl,
                      height: 120.h,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 8.h,
                    right: 8.w,
                    child: Icon(
                      product.isFavourite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),

              Padding(
                padding: EdgeInsets.all(8.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name
                    Text(
                      product.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),

                    SizedBox(height: 4.h),

                    // Category
                    Text(
                      product.category,
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 12.sp,
                      ),
                    ),

                    SizedBox(height: 6.h),

                    // Price
                    Row(
                      children: [
                        Text(
                          "\$${product.price}",
                          style: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 6.w),
                        if (product.isOnSale)
                          Text(
                            "\$${product.oldPrice}",
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              fontSize: 12.sp,
                              color: Colors.grey,
                            ),
                          ),
                      ],
                    ),

                    SizedBox(height: 6.h),

                    // Rate
                    Row(
                      children: [
                        Icon(Icons.star, size: 14.sp, color: Colors.orange),
                        SizedBox(width: 4.w),
                        Text("${product.rate}"),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
