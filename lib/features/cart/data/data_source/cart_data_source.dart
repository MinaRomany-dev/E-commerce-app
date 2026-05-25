import 'package:ecommerce2/features/cart/data/models/cart_response.dart';
import 'package:flutter/material.dart';

abstract class CartDataSource {
  Future<CartResponseModel> getCartData();

  Future<CartResponseModel> updateCartItemQuantity(int count, String productId);

  Future<CartResponseModel> removeCartItem(String productId);

  Future<CartResponseModel> clearCart();

  Future<void> addProductToCart(String productId);
}
