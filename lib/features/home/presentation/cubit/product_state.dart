part of 'product_cubit.dart';

@immutable
sealed class ProductState {
  const ProductState();
}

final class ProductInitial extends ProductState {
  const ProductInitial();
}

final class ProductLoaded extends ProductState {
  final List<ProductEntity> products;
  const ProductLoaded(this.products);
}

final class ProductError extends ProductState {
  final String message;
  const ProductError(this.message);
}

final class Productloading extends ProductState {}
