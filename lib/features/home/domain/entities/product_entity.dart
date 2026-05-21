import 'package:ecommerce2/features/home/domain/entities/brand_entity.dart';
import 'package:ecommerce2/features/home/domain/entities/category_entity.dart';

class ProductEntity {
  final String id;
  final String title;
  final String slug;
  final String description;
  final int quantity;
  final int price;
  final int? priceAfterDiscount;
  final String imageCover;
  final List<dynamic> images;
  final double ratingsAverage;
  final CategoryEntity category;
  final BrandEntity brand;
  final int? sold;
  final int? ratingsQuantity;

 const ProductEntity({
    required this.id,
    required this.title,
    required this.slug,
    required this.description,
    required this.quantity,
    required this.price,
    this.priceAfterDiscount,
    required this.imageCover,
    required this.images,
    required this.ratingsAverage,
    required this.category,
    required this.brand,
    this.sold,
    this.ratingsQuantity,
  });

  factory ProductEntity.empty() => ProductEntity(
    id: '',
    title: '',
    slug: '',
    description: '',
    quantity: 0,
    price: 0,
    imageCover: '',
    images: [],
    ratingsAverage: 0.0,
    category: CategoryEntity.empty(),
    brand: BrandEntity.empty(),
    sold: 0,
    ratingsQuantity: 0,
  );
}
