import 'package:ecommerce2/features/home/data/models/productresponse.dart';

abstract class RemoteProductDatasource {
  Future<ProductResponse> getProducts(int? pagenumber);
}
