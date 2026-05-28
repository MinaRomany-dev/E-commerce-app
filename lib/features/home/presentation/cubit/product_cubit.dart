import 'package:bloc/bloc.dart';
import 'package:ecommerce2/features/home/domain/entities/product_entity.dart';
import 'package:ecommerce2/features/home/domain/use_cases/get_product_usecase.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
part 'product_state.dart';

@injectable
class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.getProducts) : super(ProductInitial());
  GetProductUsecase getProducts;
  bool isLoadingMore = false;
  int _page = 1;
  static const int _maxPage = 3;
  final paginatedProducts = <ProductEntity>[];

  Future<void> fetchProducts() async {
    if (_page > _maxPage) return;

    if (_page == 1) {
      emit(Productloading());
    }

    final result = await getProducts(_page);

    result.fold(
      (failure) {
        emit(ProductError(failure.failmessage));
      },
      (products) {
        paginatedProducts.addAll(products);
        emit(ProductLoaded(paginatedProducts));
      },
    );
  }

  void loadNextPage() {
    _page++;
    fetchProducts();
  }
}
