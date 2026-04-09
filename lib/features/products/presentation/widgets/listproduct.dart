import 'package:ecommerce2/features/products/data/models/product.dart';
import 'package:flutter/material.dart';

class Listviewproduct extends StatelessWidget {
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
    ), Product(
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
    ), Product(
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
    ), Product(
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

  @override
  Widget build(BuildContext context) {
     return 
    GridView.builder(
      physics: BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, 
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: .76, 
      ),
      itemBuilder: (context, index) {
        final product = products[index];

        return Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
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
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                    child: Image.network(
                      product.imageUrl,
                      height: 120,
                      width: double.infinity,
                      fit: BoxFit.cover, 
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                      right: 8,
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
                padding: const EdgeInsets.all(8),
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

                    const SizedBox(height: 4),

                    // Category 
                    Text(
                      product.category,
                      style: TextStyle(color: Colors.grey[500], fontSize: 12),
                    ),

                    const SizedBox(height: 6),

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
                        const SizedBox(width: 6),
                        if (product.isOnSale)
                          Text(
                            "\$${product.oldPrice}",
                            style: const TextStyle(
                              decoration: TextDecoration.lineThrough,
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                      ],
                    ),

                    const SizedBox(height: 6),

                    // Rate
                    Row(
                      children: [
                        const Icon(Icons.star, size: 14, color: Colors.orange),
                        const SizedBox(width: 4),
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
