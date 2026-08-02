// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ecommerce2/core/api/api_manager.dart' as _i132;
import 'package:ecommerce2/core/caching/database_sql.dart' as _i961;
import 'package:ecommerce2/core/di/network_module.dart' as _i1015;
import 'package:ecommerce2/features/auth/data/data_source/local/local_datasource.dart'
    as _i660;
import 'package:ecommerce2/features/auth/data/data_source/local/secure_storage_datasource.dart'
    as _i543;
import 'package:ecommerce2/features/auth/data/data_source/remote/api_datasource.dart'
    as _i255;
import 'package:ecommerce2/features/auth/data/data_source/remote/remote_auth_data_source.dart'
    as _i302;
import 'package:ecommerce2/features/auth/data/repository/auth_repositoryimple.dart'
    as _i486;
import 'package:ecommerce2/features/auth/domain/repositories/auth_repository.dart'
    as _i877;
import 'package:ecommerce2/features/auth/domain/use_case/forget_usecase.dart'
    as _i727;
import 'package:ecommerce2/features/auth/domain/use_case/login.dart' as _i50;
import 'package:ecommerce2/features/auth/domain/use_case/logout_usecase.dart'
    as _i172;
import 'package:ecommerce2/features/auth/domain/use_case/register.dart' as _i70;
import 'package:ecommerce2/features/auth/domain/use_case/reset_password_usecase.dart'
    as _i434;
import 'package:ecommerce2/features/auth/domain/use_case/verify_code_usecase.dart'
    as _i718;
import 'package:ecommerce2/features/auth/presentation/cubit/cubit/auth_cubit.dart'
    as _i363;
import 'package:ecommerce2/features/cart/data/data_source/api_cart_data_source.dart'
    as _i895;
import 'package:ecommerce2/features/cart/data/data_source/cart_data_source.dart'
    as _i29;
import 'package:ecommerce2/features/cart/data/repositories/cart_repository_impl.dart'
    as _i86;
import 'package:ecommerce2/features/cart/domain/repo/cart_repository.dart'
    as _i947;
import 'package:ecommerce2/features/cart/domain/usecases/add_product_tocart_usecase.dart'
    as _i150;
import 'package:ecommerce2/features/cart/domain/usecases/clear_cart_usecase.dart'
    as _i925;
import 'package:ecommerce2/features/cart/domain/usecases/get_cartproducts_usecase.dart'
    as _i134;
import 'package:ecommerce2/features/cart/domain/usecases/remove_product_fromcart_usecase.dart'
    as _i827;
import 'package:ecommerce2/features/cart/domain/usecases/update_cartItem_quantity_usecase.dart'
    as _i542;
import 'package:ecommerce2/features/cart/presentation/cubit/cart_cubit.dart'
    as _i781;
import 'package:ecommerce2/features/favourite/data/datasource/api_favo_data_source.dart'
    as _i180;
import 'package:ecommerce2/features/favourite/data/datasource/favo_data_source.dart'
    as _i565;
import 'package:ecommerce2/features/favourite/data/repositories/favourite_repository_impl.dart'
    as _i1032;
import 'package:ecommerce2/features/favourite/domain/repo/favourite_repository.dart'
    as _i693;
import 'package:ecommerce2/features/favourite/domain/usecases/add_to_favourite_usecase.dart'
    as _i790;
import 'package:ecommerce2/features/favourite/domain/usecases/get_favourite_items.dart'
    as _i940;
import 'package:ecommerce2/features/favourite/domain/usecases/remove_item_usecase.dart'
    as _i357;
import 'package:ecommerce2/features/favourite/presentation/cubit/cubit/favourite_cubit.dart'
    as _i228;
import 'package:ecommerce2/features/home/data/datasource/local/product_local_data_source.dart'
    as _i119;
import 'package:ecommerce2/features/home/data/datasource/local/product_sql_data_source.dart'
    as _i821;
import 'package:ecommerce2/features/home/data/datasource/remote/product_api_data_source.dart'
    as _i92;
import 'package:ecommerce2/features/home/data/datasource/remote/remote_product_data_source.dart'
    as _i108;
import 'package:ecommerce2/features/home/data/repositories/get_product_repoimpl.dart'
    as _i550;
import 'package:ecommerce2/features/home/domain/repo/product_reposiroty.dart'
    as _i410;
import 'package:ecommerce2/features/home/domain/use_cases/get_product_usecase.dart'
    as _i878;
import 'package:ecommerce2/features/home/presentation/cubit/product_cubit.dart'
    as _i587;
import 'package:ecommerce2/features/payment/data/datasoure/api_payment_datasource.dart'
    as _i459;
import 'package:ecommerce2/features/payment/data/datasoure/payment_data_source.dart'
    as _i845;
import 'package:ecommerce2/features/payment/data/repositories/checkout_repository_impl.dart'
    as _i357;
import 'package:ecommerce2/features/payment/domain/repo/checkout_repository.dart'
    as _i746;
import 'package:ecommerce2/features/payment/domain/usecase/add_checkout_usecase.dart'
    as _i326;
import 'package:ecommerce2/features/payment/presentation/cubit/checkout_cubit.dart'
    as _i365;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger/logger.dart' as _i974;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final networkModule = _$NetworkModule();
    gh.lazySingleton<_i961.DatabaseHelper>(() => _i961.DatabaseHelper());
    gh.lazySingleton<_i974.Logger>(() => networkModule.logger);
    gh.lazySingleton<_i558.FlutterSecureStorage>(() => networkModule.storage());
    gh.singleton<_i660.LocalauthDatasouce>(
      () => _i543.SecureStorageDatasource(gh<_i558.FlutterSecureStorage>()),
    );
    gh.lazySingleton<_i119.ProductLocalDataSource>(
      () => _i821.ProductSqlDataSource(
        databaseHelper: gh<_i961.DatabaseHelper>(),
      ),
    );
    gh.singleton<_i132.ApiManager>(
      () => _i132.ApiManager(gh<_i660.LocalauthDatasouce>()),
    );
    gh.lazySingleton<_i565.FavoDataSource>(
      () => _i180.ApiFavoDataSource(gh<_i132.ApiManager>(), gh<_i974.Logger>()),
    );
    gh.lazySingleton<_i845.PaymentDataSource>(
      () => _i459.ApiPaymentDatasource(gh<_i132.ApiManager>()),
    );
    gh.lazySingleton<_i108.RemoteProductDatasource>(
      () => _i92.ProductApiDataSource(apiManager: gh<_i132.ApiManager>()),
    );
    gh.lazySingleton<_i746.PaymentRepository>(
      () => _i357.PaymentRepositoryImpl(gh<_i845.PaymentDataSource>()),
    );
    gh.lazySingleton<_i29.CartDataSource>(
      () => _i895.ApiCartDataSource(gh<_i132.ApiManager>(), gh<_i974.Logger>()),
    );
    gh.lazySingleton<_i410.ProductReposiroty>(
      () => _i550.ProductRepoimpl(
        remoteProductDatasource: gh<_i108.RemoteProductDatasource>(),
        localProductDatasource: gh<_i119.ProductLocalDataSource>(),
      ),
    );
    gh.singleton<_i302.RemoteauthDatasource>(
      () => _i255.ApiDataSource(
        apimanager: gh<_i132.ApiManager>(),
        localauthDatasouce: gh<_i660.LocalauthDatasouce>(),
      ),
    );
    gh.lazySingleton<_i878.GetProductUsecase>(
      () => _i878.GetProductUsecase(reposiroty: gh<_i410.ProductReposiroty>()),
    );
    gh.factory<_i326.AddCheckoutUsecase>(
      () => _i326.AddCheckoutUsecase(gh<_i746.PaymentRepository>()),
    );
    gh.lazySingleton<_i693.FavoRepository>(
      () => _i1032.FavoRepositoryImpl(gh<_i565.FavoDataSource>()),
    );
    gh.singleton<_i940.GetFavouriteItems>(
      () => _i940.GetFavouriteItems(gh<_i693.FavoRepository>()),
    );
    gh.singleton<_i357.RemoveItemUsecase>(
      () => _i357.RemoveItemUsecase(gh<_i693.FavoRepository>()),
    );
    gh.singleton<_i790.AddToFavouriteUsecase>(
      () => _i790.AddToFavouriteUsecase(gh<_i693.FavoRepository>()),
    );
    gh.lazySingleton<_i947.CartRepository>(
      () => _i86.CartRepositoryImpl(gh<_i29.CartDataSource>()),
    );
    gh.singleton<_i877.AuthRepository>(
      () => _i486.AuthRepositoryImpl(
        gh<_i660.LocalauthDatasouce>(),
        gh<_i302.RemoteauthDatasource>(),
      ),
    );
    gh.singleton<_i150.AddProductTocartUsecase>(
      () => _i150.AddProductTocartUsecase(gh<_i947.CartRepository>()),
    );
    gh.singleton<_i925.ClearCartUsecase>(
      () => _i925.ClearCartUsecase(gh<_i947.CartRepository>()),
    );
    gh.singleton<_i134.GetCartproductsUsecase>(
      () => _i134.GetCartproductsUsecase(gh<_i947.CartRepository>()),
    );
    gh.singleton<_i542.UpdateCartitemQuantityUsecase>(
      () => _i542.UpdateCartitemQuantityUsecase(gh<_i947.CartRepository>()),
    );
    gh.factory<_i587.ProductCubit>(
      () => _i587.ProductCubit(gh<_i878.GetProductUsecase>()),
    );
    gh.factory<_i365.CheckoutCubit>(
      () => _i365.CheckoutCubit(gh<_i326.AddCheckoutUsecase>()),
    );
    gh.factory<_i228.FavouriteCubit>(
      () => _i228.FavouriteCubit(
        gh<_i940.GetFavouriteItems>(),
        gh<_i790.AddToFavouriteUsecase>(),
        gh<_i357.RemoveItemUsecase>(),
      ),
    );
    gh.factory<_i50.LoginUseCase>(
      () => _i50.LoginUseCase(gh<_i877.AuthRepository>()),
    );
    gh.factory<_i70.RegisterUseCase>(
      () => _i70.RegisterUseCase(gh<_i877.AuthRepository>()),
    );
    gh.singleton<_i172.LogoutUsecase>(
      () => _i172.LogoutUsecase(gh<_i877.AuthRepository>()),
    );
    gh.factory<_i727.ForgetPasswordUseCase>(
      () => _i727.ForgetPasswordUseCase(gh<_i877.AuthRepository>()),
    );
    gh.factory<_i434.ResetPasswordUseCase>(
      () => _i434.ResetPasswordUseCase(gh<_i877.AuthRepository>()),
    );
    gh.factory<_i718.VerifyCodeUseCase>(
      () => _i718.VerifyCodeUseCase(gh<_i877.AuthRepository>()),
    );
    gh.singleton<_i827.RemoveProductFromcartUsecase>(
      () => _i827.RemoveProductFromcartUsecase(
        cartRepository: gh<_i947.CartRepository>(),
      ),
    );
    gh.factory<_i781.CartCubit>(
      () => _i781.CartCubit(
        gh<_i134.GetCartproductsUsecase>(),
        gh<_i150.AddProductTocartUsecase>(),
        gh<_i827.RemoveProductFromcartUsecase>(),
        gh<_i542.UpdateCartitemQuantityUsecase>(),
        gh<_i925.ClearCartUsecase>(),
      ),
    );
    gh.singleton<_i363.AuthCubit>(
      () => _i363.AuthCubit(
        gh<_i727.ForgetPasswordUseCase>(),
        gh<_i718.VerifyCodeUseCase>(),
        gh<_i434.ResetPasswordUseCase>(),
        gh<_i172.LogoutUsecase>(),
        gh<_i50.LoginUseCase>(),
        gh<_i70.RegisterUseCase>(),
      ),
    );
    return this;
  }
}

class _$NetworkModule extends _i1015.NetworkModule {}
