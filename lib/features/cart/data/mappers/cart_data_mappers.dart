import 'package:ecommerce2/features/cart/data/mappers/cart_product_mappers.dart';
import 'package:ecommerce2/features/cart/data/models/cart_data_model.dart';
import 'package:ecommerce2/features/cart/domain/entities/cart_data_entity.dart';

extension CartDataMappers on CartDataModel {
  CartDataEntity toEntity() => CartDataEntity(
    id: id,
    cartOwner: cartOwner ,
    totalCartPrice: totalCartPrice ,
    products:   products.map((e) => e.toEntity()).toList(),
  );
}
