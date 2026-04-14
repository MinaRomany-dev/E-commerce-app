// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:ecommerce2/core/di/register_module.dart' as _i710;
import 'package:ecommerce2/features/auth/data/data_source/local/local_datasource.dart'
    as _i660;
import 'package:ecommerce2/features/auth/data/data_source/local/secure_storage_datasource.dart'
    as _i543;
import 'package:ecommerce2/features/auth/data/data_source/remote/api_datasource.dart'
    as _i255;
import 'package:ecommerce2/features/auth/data/data_source/remote/auth_datasource.dart'
    as _i198;
import 'package:ecommerce2/features/auth/data/repository/auth_repositoryimple.dart'
    as _i172;
import 'package:ecommerce2/features/auth/domain/repositories/auth_repository.dart'
    as _i877;
import 'package:ecommerce2/features/auth/domain/use_case/login.dart' as _i50;
import 'package:ecommerce2/features/auth/domain/use_case/register.dart' as _i70;
import 'package:ecommerce2/features/auth/presentation/cubit/cubit/auth_cubit.dart'
    as _i363;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.singleton<_i361.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i558.FlutterSecureStorage>(() => registerModule.storage);
    gh.singleton<_i198.RemoteauthDatasource>(
      () => _i255.ApiDataSource(dio: gh<_i361.Dio>()),
    );
    gh.singleton<_i660.LocalauthDatasouce>(
      () => _i543.SecureStorageDatasource(gh<_i558.FlutterSecureStorage>()),
    );
    gh.singleton<_i877.AuthRepository>(
      () => _i172.AuthRepositoryImpl(
        gh<_i660.LocalauthDatasouce>(),
        gh<_i198.RemoteauthDatasource>(),
      ),
    );
    gh.factory<_i50.LoginUseCase>(
      () => _i50.LoginUseCase(gh<_i877.AuthRepository>()),
    );
    gh.factory<_i70.RegisterUseCase>(
      () => _i70.RegisterUseCase(gh<_i877.AuthRepository>()),
    );
    gh.factory<_i363.AuthCubit>(
      () =>
          _i363.AuthCubit(gh<_i50.LoginUseCase>(), gh<_i70.RegisterUseCase>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i710.RegisterModule {}
