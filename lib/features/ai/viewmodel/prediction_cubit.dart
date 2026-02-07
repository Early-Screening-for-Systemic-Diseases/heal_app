import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../data/repository/prediction_repository.dart';
import '../data/model/health_data_model.dart';
import 'prediction_state.dart';

@lazySingleton
class PredictionCubit extends Cubit<PredictionState> {
  final PredictionRepository _repository;

  PredictionCubit(this._repository) : super(PredictionInitial());

  Future<void> predictImage(File imageFile, String imageUrl) async {
    emit(PredictionLoading());
    final response = await _repository.predictImage(imageFile, imageUrl);
    response.fold(
      (failure) => emit(PredictionError(failure.message)),
      (predictionResponse) => emit(PredictionSuccess(predictionResponse.prediction)),
    );
  }

  Future<void> predictHealthData(HealthDataModel healthData) async {
    emit(PredictionLoading());
    final response = await _repository.predictHealthData(healthData);
    response.fold(
      (failure) => emit(PredictionError(failure.message)),
      (predictionResponse) => emit(PredictionSuccess(predictionResponse.prediction)),
    );
  }

  Future<void> predictAnemiaImage(File imageFile, String imageUrl) async {
    emit(PredictionLoading());
    final response = await _repository.predictAnemiaImage(imageFile, imageUrl);
    response.fold(
      (failure) => emit(PredictionError(failure.message)),
      (predictionResponse) => emit(PredictionSuccess(predictionResponse.prediction)),
    );
  }

  Future<void> predictAnemiaSurvey(Map<String, dynamic> surveyData) async {
    emit(PredictionLoading());
    final response = await _repository.predictAnemiaSurvey(surveyData);
    response.fold(
      (failure) => emit(PredictionError(failure.message)),
      (predictionResponse) => emit(PredictionSuccess(predictionResponse.prediction)),
    );
  }

  Future<void> predictFromText(String text) async {
    emit(PredictionLoading());
    final response = await _repository.predictFromText(text);
    response.fold(
      (failure) => emit(PredictionError(failure.message)),
      (textResponse) => emit(TextPredictionSuccess(textResponse)),
    );
  }
}
