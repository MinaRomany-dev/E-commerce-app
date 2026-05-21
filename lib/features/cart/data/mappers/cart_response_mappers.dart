import 'package:ecommerce2/features/cart/data/mappers/cart_data_mappers.dart';
import 'package:ecommerce2/features/cart/data/models/cart_response.dart';
import 'package:ecommerce2/features/cart/domain/entities/cart_response_entity.dart';

extension CartResponseMapper on CartResponseModel {
  CartResponseEntity toEntity() => CartResponseEntity(
    cartId: cartId,
    cartdata: cartdata.toEntity() ,
    numOfCartItems: numOfCartItems,
  );
}
