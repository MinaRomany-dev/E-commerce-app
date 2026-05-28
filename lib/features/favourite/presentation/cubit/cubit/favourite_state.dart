part of 'favourite_cubit.dart';

@immutable
sealed class FavouriteState {}

final class FavouriteInitial extends FavouriteState {}

final class FavouriteLoaded extends FavouriteState {
  final List<ProductEntity> products;
  FavouriteLoaded({required this.products});
}

final class FavouriteLoading extends FavouriteState {}

final class FavouriteError extends FavouriteState {
  final String message;
  FavouriteError({required this.message});
}

final class FavouriteAdded extends FavouriteState {}

final class FavouriteRemoved extends FavouriteState {}
