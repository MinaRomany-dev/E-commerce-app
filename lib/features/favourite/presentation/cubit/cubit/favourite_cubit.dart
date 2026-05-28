import 'package:ecommerce2/features/favourite/domain/usecases/add_to_favourite_usecase.dart';
import 'package:ecommerce2/features/favourite/domain/usecases/get_favourite_items.dart';
import 'package:ecommerce2/features/favourite/domain/usecases/remove_item_usecase.dart';
import 'package:ecommerce2/features/home/domain/entities/product_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
part 'favourite_state.dart';

@injectable
class FavouriteCubit extends Cubit<FavouriteState> {
  final GetFavouriteItems getFavouriteItems;
  final AddToFavouriteUsecase addToFavouriteUsecase;
  final RemoveItemUsecase removeFromFavouriteUsecase;
  FavouriteCubit(
    this.getFavouriteItems,
    this.addToFavouriteUsecase,
    this.removeFromFavouriteUsecase,
  ) : super(FavouriteInitial());

  Future<void> fetchSavedItems() async {
    emit(FavouriteLoading());
    final result = await getFavouriteItems();
    result.fold(
      (failure) => emit(FavouriteError(message: failure.failmessage)),
      (product) => emit(FavouriteLoaded(products: product)),
    );
  }

  Future<void> addToFavourite(String productId) async {
    final result = await addToFavouriteUsecase(productId);
    result.fold(
      (failure) => emit(FavouriteError(message: failure.failmessage)),
      (_) => emit(FavouriteAdded()),
    );
    fetchSavedItems();
  }

  Future<void> removeFromFavourite(String productId) async {
    final result = await removeFromFavouriteUsecase(productId);
    result.fold(
      (failure) => emit(FavouriteError(message: failure.failmessage)),
      (_) => emit(FavouriteRemoved()),
    );
    await fetchSavedItems();
  }
}
