import 'package:bloc/bloc.dart';
import 'package:ecommerce2/features/navbar/presentation/cubit/cubit/navbar_state.dart';

class NavbarCubit extends Cubit<NavbarState> {
  NavbarCubit() : super(Changebody(screennum: 0));
  void swapbody(int index) {
    emit(Changebody(screennum: index));
  }
}
