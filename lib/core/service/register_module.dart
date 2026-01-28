import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../shared/constants/constants.dart';

@module
abstract class RegisterModule {
  @singleton
  @Named('MainDio')
  Dio get mainDio =>
      Dio(BaseOptions(baseUrl: Constants().devBaseUrl, receiveDataWhenStatusError: true));

  @singleton
  @Named('PredictDio')
  Dio get predictDio =>
      Dio(BaseOptions(baseUrl: Constants().predictBaseUrl, receiveDataWhenStatusError: true));
}
