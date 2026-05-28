import 'package:dio/dio.dart';
import 'package:ecommerce2/core/api/api_manager.dart';
import 'package:ecommerce2/core/constants/constants.dart';
import 'package:ecommerce2/core/error/error_handler.dart';
import 'package:ecommerce2/core/error/exceptions.dart';
import 'package:ecommerce2/features/home/data/datasource/remote/remote_product_data_source.dart';
import 'package:ecommerce2/features/home/data/models/productresponse.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: RemoteProductDatasource)
class ProductApiDataSource implements RemoteProductDatasource {
  final ApiManager apiManager;
  const ProductApiDataSource({required this.apiManager});

  @override
  Future<ProductResponse> getProducts(int? pagenumber) async {
    try {
      final response = await apiManager.getData(
        queryParameters: {'limit': 20, "page": pagenumber},
        endPoint: Constants.productEndPoint,
      );
      return ProductResponse.fromJson(response.data);
    } catch (e, stack) {
      print('$stack');
      if (e is DioException) {
        throw handleDioError(e);
      }
      throw ServerException("Failed to get products");
    }
  }
}
