import 'package:bloc/bloc.dart';
import 'package:ecommerce2/features/cart/domain/entities/cart_data_entity.dart';
import 'package:ecommerce2/features/cart/domain/entities/cart_product_entity.dart';
import 'package:ecommerce2/features/cart/domain/usecases/add_product_tocart_usecase.dart';
import 'package:ecommerce2/features/cart/domain/usecases/clear_cart_usecase.dart';
import 'package:ecommerce2/features/cart/domain/usecases/get_cartproducts_usecase.dart';
import 'package:ecommerce2/features/cart/domain/usecases/remove_product_fromcart_usecase.dart';
import 'package:ecommerce2/features/cart/domain/usecases/update_cartItem_quantity_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';
@injectable
class CartCubit extends Cubit<CartState> {
  final GetCartproductsUsecase getCartproductsUsecase;
  final AddProductTocartUsecase addProductTocartUsecase;
  final RemoveProductFromcartUsecase removeProductFromCartUsecase;
  final UpdateCartitemQuantityUsecase updateCartItemQuantityUsecase;
  final ClearCartUsecase clearCartUsecase;

  CartCubit(
    this.getCartproductsUsecase,
    this.addProductTocartUsecase,
    this.removeProductFromCartUsecase,
    this.updateCartItemQuantityUsecase,
    this.clearCartUsecase,
  ) : super(CartInitial());

  /// GET CART
  Future<void> getCart() async {
    emit(CartLoading());

    final result = await getCartproductsUsecase();

    result.fold(
      (failure) => emit(CartError(failure.failmessage)),
      (cart) => emit(CartLoaded(cartdata: cart)),
    );
  }

  /// ADD PRODUCT
  Future<void> addToCart(String productId) async {
    emit(CartLoading());

    final result = await addProductTocartUsecase(productId);

    result.fold(
      (failure) => emit(CartError(failure.failmessage)),
      (cart) => emit(CartOperationSuccess("Product added successfully")),
    );

    await getCart(); // refresh cart
  }

  /// REMOVE PRODUCT
  Future<void> removeFromCart(String productId) async {
    emit(CartLoading());

    final result = await removeProductFromCartUsecase(productId);

    result.fold(
      (failure) => emit(CartError(failure.failmessage)),
      (cart) => emit(CartOperationSuccess("Product removed successfully")),
    );

    await getCart();
  }

  /// UPDATE QUANTITY
  Future<void> updateQuantity(int count, String productId) async {
    emit(CartLoading());

    final result = await updateCartItemQuantityUsecase(count, productId);

    result.fold(
      (failure) => emit(CartError(failure.failmessage)),
      (cart) => emit(CartOperationSuccess("Cart updated successfully")),
    );

    await getCart();
  }

  /// CLEAR CART
  Future<void> clearCart() async {
    emit(CartLoading());

    final result = await clearCartUsecase();

    result.fold(
      (failure) => emit(CartError(failure.failmessage)),
      (cart) => emit(CartOperationSuccess("Cart cleared successfully")),
    );

    await getCart();
  }
}

