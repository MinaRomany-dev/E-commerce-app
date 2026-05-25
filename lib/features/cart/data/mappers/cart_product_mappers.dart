import 'package:ecommerce2/features/cart/data/models/cart_product_model.dart';
import 'package:ecommerce2/features/cart/domain/entities/cart_product_entity.dart';
import 'package:ecommerce2/features/home/data/datasource/mappers/product_mapper.dart';

extension CartProductMappers on CartProductModel {
  CartProductEntity toEntity() => CartProductEntity(
    id: id,
    count: count ,
    price: price ,
    product: product.toEntity() ,
  );
}
