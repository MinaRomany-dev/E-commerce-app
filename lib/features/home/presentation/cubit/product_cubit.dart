import 'package:bloc/bloc.dart';
import 'package:ecommerce2/features/home/domain/entities/product_entity.dart';
import 'package:ecommerce2/features/home/domain/use_cases/get_product_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

@injectable
class ProductCubit extends Cubit<ProductState> {
  GetProductUsecase getProducts;

  ProductCubit(this.getProducts) : super(ProductInitial());

  Future<void> fetchproducts() async {
    emit(Productloading());
    final result = await getProducts();
    result.fold(
      (failure) => emit(ProductError(failure.failmessage)),
      (products) => emit(ProductLoaded(products)),
    );
  }
}
