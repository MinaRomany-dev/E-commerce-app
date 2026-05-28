import 'package:ecommerce2/features/cart/domain/entities/cart_product_entity.dart';

class CartDataEntity {
  final String id;
  final String cartOwner;
  final List<CartProductEntity> products;
  final int totalCartPrice;

  const CartDataEntity({
    required this.id,
    required this.products,
    required this.cartOwner,
    required this.totalCartPrice,
  });
}
