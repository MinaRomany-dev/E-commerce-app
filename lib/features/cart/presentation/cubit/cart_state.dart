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

class CartAddedSuccess extends CartState {
  final String message;

  const CartAddedSuccess(this.message);
}

sealed class CounterState {
  final int count;
  final String message;
  const CounterState(this.count, this.message);
}

class CounterInitial extends CounterState {
  const CounterInitial(int mm) : super(mm, "");
}
