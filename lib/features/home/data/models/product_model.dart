import 'brand_model.dart';
import 'category_model.dart';
import 'subcategory.dart';

class ProductModel {
  int? sold;
  List<dynamic>? images;
  List<Subcategory>? subcategory;
  int? ratingsQuantity;
  String id;
  String? title;
  String? slug;
  String? description;
  int? quantity;
  int? price;
  String? imageCover;
  CategoryModel? category;
  BrandModel? brand;
  double? ratingsAverage;
  DateTime? createdAt;
  DateTime? updatedAt;
 
  int? priceAfterDiscount;
  List<dynamic>? availableColors;

  ProductModel({
    this.sold,
    this.images,
    this.subcategory,
    this.ratingsQuantity,
  required  this.id,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
    this.createdAt,
    this.updatedAt,
  
    this.priceAfterDiscount,
    this.availableColors,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    sold: json['sold'] as int?,
  images: List<String>.from(json['images'] ?? []),
    subcategory: (json['subcategory'] as List<dynamic>?)
        ?.map((e) => Subcategory.fromJson(e as Map<String, dynamic>))
        .toList(),
    ratingsQuantity: json['ratingsQuantity'] as int?,
    id: json['_id'] as String,
    title: json['title'] as String?,
    slug: json['slug'] as String?,
    description: json['description'] as String?,
    quantity: json['quantity'] as int?,
    price: json['price'] as int?,
    imageCover: json['imageCover'] as String?,
    category: json['category'] == null
        ? null
        : CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
    brand: json['brand'] == null
        ? null
        : BrandModel.fromJson(json['brand'] as Map<String, dynamic>),
    ratingsAverage: (json['ratingsAverage'] as num?)?.toDouble(),
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
    priceAfterDiscount: json['priceAfterDiscount'] as int?,
    availableColors: json['availableColors'] as List<dynamic>?,
  );

}
