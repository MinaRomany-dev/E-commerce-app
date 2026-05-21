import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'products_details_state.dart';

class ProductsDetailsCubit extends Cubit<ProductsDetailsState> {
  ProductsDetailsCubit() : super(ProductsDetailsInitial());
}
