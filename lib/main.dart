import 'package:ecommerce2/core/di/service_locator.dart';
import 'package:ecommerce2/core/routes/genearate_route.dart';
import 'package:ecommerce2/core/routes/routes.dart';
import 'package:ecommerce2/core/appobserver.dart';
import 'package:ecommerce2/features/auth/presentation/cubit/cubit/auth_cubit.dart';
import 'package:ecommerce2/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:ecommerce2/features/home/presentation/cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  Bloc.observer = AppBlocObserver();
  setupLocator();
  runApp(const Ecommerce());
}

class Ecommerce extends StatelessWidget {
  const Ecommerce({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
       
        BlocProvider(
          create: (context) => servicelocator.get<CartCubit>()..getCart(),
        ),
        BlocProvider(create: (context) => servicelocator.get<AuthCubit>()),
        BlocProvider(
          create: (context) =>
              servicelocator.get<ProductCubit>()..fetchProducts(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: Routes.home,
            onGenerateRoute: GenearateRoute.generateRoute,
          );
        },
      ),
    );
  }
}
