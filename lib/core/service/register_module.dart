import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../shared/constants/constants.dart';

@module
abstract class RegisterModule {
  @singleton
  @Named('MainDio')
  Dio get mainDio => Dio(
    BaseOptions(
      baseUrl: Constants().devBaseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
    ),
  );
}
