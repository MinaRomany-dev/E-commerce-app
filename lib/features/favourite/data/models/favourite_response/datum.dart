// import 'package:ecommerce2/core/models/brand_model.dart';
// import 'package:ecommerce2/core/models/category_model.dart';
// import 'package:ecommerce2/core/models/subcategory.dart';

// class Datum {
//   final int sold;
//   final List<String> images;
//   final List<Subcategory> subcategory;
//   final int ratingsQuantity;
//   final String id;
//   final String? title;
//   final String? slug;
//   final String? description;
//   final int? quantity;
//   final int? price;
//   final String? imageCover;
//   final CategoryModel? category;
//   final BrandModel? brand;
//   final int? ratingsAverage;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;

//   const Datum({
//     this.sold,
//     this.images,
//     this.subcategory,
//     this.ratingsQuantity,
//     this.id,
//     this.title,
//     this.slug,
//     this.description,
//     this.quantity,
//     this.price,
//     this.imageCover,
//     this.category,
//     this.brand,
//     this.ratingsAverage,
//     this.createdAt,
//     this.updatedAt,

//   });

//   factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//     sold: json['sold'] as int?,
//     images: json['images'] as List<String>?,
//     subcategory: (json['subcategory'] as List<dynamic>?)
//         ?.map((e) => Subcategory.fromJson(e as Map<String, dynamic>))
//         .toList(),
//     ratingsQuantity: json['ratingsQuantity'] as int?,
//     id: json['_id'] as String?,
//     title: json['title'] as String?,
//     slug: json['slug'] as String?,
//     description: json['description'] as String?,
//     quantity: json['quantity'] as int?,
//     price: json['price'] as int?,
//     imageCover: json['imageCover'] as String?,
//     category: json['category'] == null
//         ? null
//         : CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
//     brand: json['brand'] == null
//         ? null
//         : BrandModel.fromJson(json['brand'] as Map<String, dynamic>),
//     ratingsAverage: json['ratingsAverage'] as int?,
//     createdAt: json['createdAt'] == null
//         ? null
//         : DateTime.parse(json['createdAt'] as String),
//     updatedAt: json['updatedAt'] == null
//         ? null
//         : DateTime.parse(json['updatedAt'] as String),

//   );

// }
