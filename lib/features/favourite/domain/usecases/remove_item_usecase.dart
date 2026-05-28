import 'package:dartz/dartz.dart';
import 'package:ecommerce2/core/error/failure.dart';
import 'package:ecommerce2/features/favourite/domain/repo/favourite_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class RemoveItemUsecase {
  final FavoRepository favoRepository;
  RemoveItemUsecase(this.favoRepository);
  Future<Either<AppFailure, void>> call(String productId) async {
    return await favoRepository.removeProductFromFavo(productId);
  }
}
