import 'package:dartz/dartz.dart';
import 'package:ecommerce2/core/error/failure.dart';
import 'package:ecommerce2/features/favourite/domain/repo/favourite_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class AddToFavouriteUsecase {
  final FavoRepository repository;

  AddToFavouriteUsecase(this.repository);
  Future<Either<AppFailure, void>> call(String productId) {
    return repository.addProductToFavo(productId);
  }
}
