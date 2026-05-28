import 'dart:convert';
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
  bool isfavorite;

  ProductModel({
    this.sold,
    this.images,
    this.subcategory,
    this.ratingsQuantity,
    required this.id,
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
    this.isfavorite = false,
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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'imageCover': imageCover,
      'images': jsonEncode(images),
      'categoryName': category?.name,
      'ratingsAverage': ratingsAverage,
      'ratingsQuantity': ratingsQuantity,
      'priceAfterDiscount': priceAfterDiscount,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      price: map['price'],
      imageCover: map['imageCover'],
      images: List<String>.from(jsonDecode(map['images'] ?? '[]')),
      ratingsAverage: map['ratingsAverage']?.toDouble(),
      ratingsQuantity: map['ratingsQuantity'],
      priceAfterDiscount: map['priceAfterDiscount'],
      category: CategoryModel.fromMap({'name': map['categoryName']}),
    );
  }
}
// // }
// class ProductModel {
//   final String id;
//   final String title;
//   final String description;
//   final int quantity;
//   final int sold;

//   final double price;
//   final double? priceAfterDiscount;

//   final double ratingsAverage;
//   final int ratingsQuantity;

//   final String imageCover;
//   final List<String> images;

//   final CategoryModel category;
//   final BrandModel brand;

//   ProductModel({
//     required this.id,
//     required this.title,
//     required this.description,
//     required this.quantity,
//     required this.sold,
//     required this.price,
//     required this.priceAfterDiscount,
//     required this.ratingsAverage,
//     required this.ratingsQuantity,
//     required this.imageCover,
//     required this.images,
//     required this.category,
//     required this.brand,
//   });

//   factory ProductModel.fromJson(Map<String, dynamic> json) {
//     return ProductModel(
//       id: json['id'] ?? '',
//       title: json['title'] ?? '',
//       description: json['description'] ?? '',
//       quantity: json['quantity'] ?? 0,
//       sold: json['sold'] ?? 0,

//       price: (json['price'] ?? 0).toDouble(),

//       // nullable لأن بعض المنتجات معندهاش discount
//       priceAfterDiscount:
//           json['priceAfterDiscount'] != null
//               ? (json['priceAfterDiscount']).toDouble()
//               : null,

//       ratingsAverage:
//           (json['ratingsAverage'] ?? 0).toDouble(),

//       ratingsQuantity: json['ratingsQuantity'] ?? 0,

//       imageCover: json['imageCover'] ?? '',

//       images:
//           (json['images'] as List<dynamic>?)
//               ?.map((e) => e.toString())
//               .toList() ??
//           [],

//       category: CategoryModel.fromJson(
//         json['category'] ?? {},
//       ),

//       brand: BrandModel.fromJson(
//         json['brand'] ?? {},
//       ),
//     );
//   }
// }
