import 'package:equatable/equatable.dart';
import '../data/model/text_prediction_response.dart';

abstract class PredictionState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PredictionInitial extends PredictionState {}

class PredictionLoading extends PredictionState {}

class PredictionSuccess extends PredictionState {
  final String prediction;

  PredictionSuccess(this.prediction);

  @override
  List<Object?> get props => [prediction];
}

class TextPredictionSuccess extends PredictionState {
  final TextPredictionResponse response;

  TextPredictionSuccess(this.response);

  @override
  List<Object?> get props => [response];
}

class PredictionError extends PredictionState {
  final String message;

  PredictionError(this.message);

  @override
  List<Object?> get props => [message];
}