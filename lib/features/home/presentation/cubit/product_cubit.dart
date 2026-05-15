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
  int page = 1;
  int maxPage = 3;
  final ScrollController scrollController = ScrollController();
  final paginatedProducts = <ProductEntity>[];

  void onScroll() {
    scrollController.addListener(() {
      print(
        " ******************-------------------------------------SCROLLING...",
      );

      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {

        page++;
        if(page <= maxPage){
           fetchProducts();
        }
       
      }
    });
  }

  Future<void> fetchProducts() async {
    if (isLoadingMore) return;

    isLoadingMore = true;

    if (page == 1) {
      emit(Productloading());
    }

    final result = await getProducts(page);

    result.fold(
      (failure) {
        emit(ProductError(failure.failmessage));
      },
      (products) {
        paginatedProducts.addAll(products);
        emit(ProductLoaded(paginatedProducts));
      },
    );

    isLoadingMore = false;
  }
}
