class Product {
  final String name;
  final String description;
  final double price;
  final double oldPrice;
  final bool isFavourite;
  final bool isOnSale;
  final String imageUrl;
  final double rate;
  final int comments;
  final String category; 

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.oldPrice,
    required this.isFavourite,
    required this.isOnSale,
    required this.imageUrl,
    required this.rate,
    required this.comments,
    required this.category,
  });
}