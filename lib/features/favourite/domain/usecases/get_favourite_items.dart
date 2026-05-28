import 'package:dartz/dartz.dart';
import 'package:ecommerce2/core/error/failure.dart';
import 'package:ecommerce2/features/favourite/domain/repo/favourite_repository.dart';
import 'package:ecommerce2/features/home/domain/entities/product_entity.dart';
import 'package:injectable/injectable.dart';

@singleton
class GetFavouriteItems {
  final FavoRepository favoRepository;

  GetFavouriteItems(this.favoRepository);

  Future<Either<AppFailure, List<ProductEntity>>> call() async {
    return await favoRepository.getFavoProducts();
  }
}
