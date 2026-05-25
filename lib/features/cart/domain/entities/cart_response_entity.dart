import 'package:ecommerce2/features/cart/domain/entities/cart_data_entity.dart';

class CartResponseEntity {
  final int numOfCartItems;
  final String cartId;
  final CartDataEntity cartdata;
  
  const CartResponseEntity({
    required this.cartdata,
   required this.numOfCartItems,
    required this.cartId,
  });
}
