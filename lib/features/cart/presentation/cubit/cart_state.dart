part of 'cart_cubit.dart';

@immutable
sealed class CartState {
  const CartState();
}

class CartInitial extends CartState {
  const CartInitial();
}

class CartLoading extends CartState {
  const CartLoading();
}

class CartLoaded extends CartState {
  final CartDataEntity cartdata; 
  
 const CartLoaded({required this.cartdata});
}

class CartError extends CartState {
  final String message;

 const CartError(this.message);
}

class CartOperationSuccess extends CartState {
  final String message;

  const CartOperationSuccess(this.message);
}
