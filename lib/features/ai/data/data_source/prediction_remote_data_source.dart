import 'dart:io';

import '../model/prediction_response.dart';
import '../model/health_data_model.dart';

abstract class PredictionRemoteDataSource {
  Future<PredictionResponse> predictImage(File imageFile);
  Future<PredictionResponse> predictHealthData(HealthDataModel healthData);
}
