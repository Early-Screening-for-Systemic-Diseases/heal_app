import 'dart:io';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/api/api_endpoints.dart';
import '../../../../core/error/api_error_handler.dart';
import '../model/prediction_response.dart';
import '../model/health_data_model.dart';
import 'prediction_remote_data_source.dart';

@LazySingleton(as: PredictionRemoteDataSource)
class PredictionApiDataSource implements PredictionRemoteDataSource {
  final Dio _mainDio;
  final Dio _predictDio;

  PredictionApiDataSource(@Named('MainDio') this._mainDio, @Named('PredictDio') this._predictDio);

  @override
  Future<PredictionResponse> predictImage(File imageFile) async {
    try {
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(imageFile.path, filename: 'image.jpg'),
      });

      final response = await _mainDio.post(ApiEndpoints.diabetesPredict, data: formData);

      return PredictionResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw ApiErrorHandler.handleDioError(e);
    }
  }

  @override
  Future<PredictionResponse> predictHealthData(HealthDataModel healthData) async {
    try {
      final response = await _predictDio.post(
        ApiEndpoints.diabetesPredict,
        data: healthData.toJson(),
      );
      print(response.data);
      return PredictionResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw ApiErrorHandler.handleDioError(e);
    }
  }
}
