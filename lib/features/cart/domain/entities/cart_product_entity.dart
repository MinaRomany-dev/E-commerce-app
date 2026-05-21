import 'package:ecommerce2/features/home/domain/entities/product_entity.dart';

class CartProductEntity {
   final String id;
   final int? count;
  final ProductEntity product;
  final int? price;


const  CartProductEntity({
    this.count,
    required this.id,
  required  this.product,
    this.price,
  });

 }
