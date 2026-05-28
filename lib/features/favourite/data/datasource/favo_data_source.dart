import 'package:ecommerce2/features/favourite/data/models/favourite_response/favourite_response.dart';

abstract class FavoDataSource {
  Future<void> addProductToFavo(String productId);

  Future<void> removeProductFromFavo(String productId);
  Future<FavouriteResponse> getFavoProductsIds();
}
