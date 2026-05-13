import 'package:dio/dio.dart';
import 'package:ecommerce2/core/api/api_manager.dart';
import 'package:ecommerce2/core/constants/constants.dart';
import 'package:ecommerce2/core/error/error_handler.dart';
import 'package:ecommerce2/core/error/exceptions.dart';
import 'package:ecommerce2/features/home/data/datasource/remote/home_datasource.dart';
import 'package:ecommerce2/features/home/data/models/productresponse.dart';
import 'package:injectable/injectable.dart';
@LazySingleton(as: HomeDatasource)
class HomeApi implements HomeDatasource {
  final ApiManager apiManager;
const  HomeApi({required this.apiManager});

  @override
  Future<ProductResponse> getProducts() async {
    try {
      final response = await apiManager.getData(
        endPoint: Constants.productEndPoint,
      );
      return ProductResponse.fromJson(response.data);
    } catch (e, stack) {
      print('$stack');
      if (e is DioException) {
        throw handleDioError(e);
      }
      throw ServerException ("Failed to get products");
    }
  }
}
