import 'package:ecommerce2/features/home/data/models/productresponse.dart';

abstract class HomeDatasource {
  Future<ProductResponse> getProducts(int? pagenumber);
}
