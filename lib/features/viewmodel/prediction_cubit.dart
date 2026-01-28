import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../data/repository/prediction_repository.dart';
import 'prediction_state.dart';

@lazySingleton
class PredictionCubit extends Cubit<PredictionState> {
  final PredictionRepository _repository;

  PredictionCubit(this._repository) : super(PredictionInitial());

  Future<void> predictImage(File imageFile) async {
    emit(PredictionLoading());
    final response = await _repository.predictImage(imageFile);
    response.fold(
      (failure) {
        emit(PredictionError(failure.message));
      },
      (predictionResponse) {
        emit(PredictionSuccess(predictionResponse.prediction));
      },
    );
  }
}
