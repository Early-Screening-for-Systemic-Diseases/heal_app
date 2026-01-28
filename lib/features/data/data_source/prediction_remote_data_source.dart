import 'dart:io';

import '../model/prediction_response.dart';

abstract class PredictionRemoteDataSource {
  Future<PredictionResponse> predictImage(File imageFile);
}
