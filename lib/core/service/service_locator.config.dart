// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:heal_app/core/service/register_module.dart' as _i155;
import 'package:heal_app/features/data/data_source/prediction_api_data_source.dart'
    as _i747;
import 'package:heal_app/features/data/data_source/prediction_remote_data_source.dart'
    as _i103;
import 'package:heal_app/features/data/repository/prediction_repository.dart'
    as _i672;
import 'package:heal_app/features/viewmodel/prediction_cubit.dart' as _i115;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.singleton<_i361.Dio>(
      () => registerModule.predictDio,
      instanceName: 'PredictDio',
    );
    gh.singleton<_i361.Dio>(
      () => registerModule.mainDio,
      instanceName: 'MainDio',
    );
    gh.lazySingleton<_i103.PredictionRemoteDataSource>(
      () => _i747.PredictionApiDataSource(
        gh<_i361.Dio>(instanceName: 'MainDio'),
        gh<_i361.Dio>(instanceName: 'PredictDio'),
      ),
    );
    gh.lazySingleton<_i672.PredictionRepository>(
      () => _i672.PredictionRepository(gh<_i103.PredictionRemoteDataSource>()),
    );
    gh.lazySingleton<_i115.PredictionCubit>(
      () => _i115.PredictionCubit(gh<_i672.PredictionRepository>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i155.RegisterModule {}
