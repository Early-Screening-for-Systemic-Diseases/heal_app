import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/error/faliure.dart';
import '../data_source/prediction_remote_data_source.dart';
import '../model/prediction_response.dart';
import '../model/health_data_model.dart';

@lazySingleton
class PredictionRepository {
  final PredictionRemoteDataSource _dataSource;
  PredictionRepository(this._dataSource);

  Future<Either<Failure, PredictionResponse>> predictImage(File imageFile) async {
    try {
      final response = await _dataSource.predictImage(imageFile);
      return Right(response);
    } on RemoteException catch (e) {
      return Left(Failure(e.message));
    }
  }

  Future<Either<Failure, PredictionResponse>> predictHealthData(HealthDataModel healthData) async {
    try {
      final response = await _dataSource.predictHealthData(healthData);
      return Right(response);
    } on RemoteException catch (e) {
      return Left(Failure(e.message));
    }
  }
}
