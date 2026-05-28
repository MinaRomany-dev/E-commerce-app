import 'dart:convert';
import 'package:ecommerce2/core/models/category_model.dart';

class ProductCachedModel {
  String id;
  String title;
  String description;
  int price;
  String imageCover;
  List<dynamic> images;
  int ratingsQuantity;
  double ratingsAverage;

  CategoryModel category;
  int? priceAfterDiscount;
  ProductCachedModel({
    required this.images,
    required this.ratingsQuantity,
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageCover,
    required this.category,
    required this.ratingsAverage,
    this.priceAfterDiscount,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'imageCover': imageCover,
      'images': jsonEncode(images),
      'categoryName': category.name,
      'ratingsAverage': ratingsAverage,
      'ratingsQuantity': ratingsQuantity,
      'priceAfterDiscount': priceAfterDiscount,
    };
  }

  factory ProductCachedModel.fromMap(Map<String, dynamic> map) {
    return ProductCachedModel(
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
